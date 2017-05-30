<?php

namespace app\models;

use yii;
use yii\base\Model;

class Content extends Model
{
    static public function getLessons()
    {
        $sql = "SELECT l.*, COUNT(w.id) AS words_count FROM lessons l
                LEFT JOIN words w ON l.id = w.lesson_id 
                GROUP BY l.id
                ORDER BY l.ordering";

        return Yii::$app->db->createCommand($sql)->queryAll();
    }

    static public function isLessonExists($id)
    {
        $sql = "SELECT 1 FROM lessons 
                WHERE id = :id";

        return (bool)Yii::$app->db->createCommand($sql, [':id' => $id])->queryColumn();
    }

    static public function getLessonData($id)
    {
        $sql = "SELECT * FROM lessons WHERE id = :id LIMIT 1";
        $lesson_data = Yii::$app->db->createCommand($sql, [':id' => $id])->queryOne();

        $sql = "SELECT * FROM words
                WHERE lesson_id = :lesson_id";
        $words = Yii::$app->db->createCommand($sql, [':lesson_id' => $id])->queryAll();

        return [
            'lesson' => $lesson_data,
            'words' => $words
        ];
    }

    static public function canIAddWordToLesson($lesson_id)
    {
        $sql = "SELECT COUNT(id) AS words_count FROM words
                WHERE lesson_id = :lesson_id";

        $words_count = (int)Yii::$app->db->createCommand($sql, [':lesson_id' => $lesson_id])->queryScalar();

        return ($words_count < 12);
    }

    static public function addWord($data)
    {
        return (1 == Yii::$app->db->createCommand()->insert('words', $data)->execute());
    }

    static public function getWordNextOrderWithinLesson($lesson_id)
    {
        $sql = "SELECT MAX(ordering) FROM words
                WHERE lesson_id = :lesson_id
                LIMIT 1";

        return (1 + (int)Yii::$app->db->createCommand($sql, [':lesson_id' => $lesson_id])->queryScalar());
    }

    static public function removeWord($id)
    {
        return (1 == (int)Yii::$app->db->createCommand()->delete('words', ['id' => $id])->execute());
    }

    static public function getWordById($id)
    {
        $sql = "SELECT w.*, l.id AS lesson_id FROM words w
                LEFT JOIN lessons l ON w.lesson_id = l.id
                WHERE w.id = :id LIMIT 1";

        return Yii::$app->db->createCommand($sql, [':id' => $id])->queryOne();
    }

    static public function editWord($data, $id)
    {
        return (1 == Yii::$app->db->createCommand()->update('words', $data, ['id' => $id])->execute());
    }

    static public function getWordsCount()
    {
        $sql = "SELECT COUNT(id) AS words_count FROM words";

        return Yii::$app->db->createCommand($sql)->queryScalar();
    }
}