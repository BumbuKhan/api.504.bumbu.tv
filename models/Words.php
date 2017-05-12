<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "words".
 *
 * @property integer $id
 * @property integer $lesson_id
 * @property string $word
 * @property string $definition
 * @property string $example_a
 * @property string $example_b
 * @property string $example_c
 * @property integer $ordering
 * @property string $is_deleted
 *
 * @property Lessons $lesson
 */
class Words extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'words';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['lesson_id', 'word', 'definition', 'example_a', 'example_b', 'example_c', 'ordering'], 'required'],
            [['lesson_id', 'ordering'], 'integer'],
            [['is_deleted'], 'string'],
            [['word'], 'string', 'max' => 100],
            [['definition', 'example_a', 'example_b', 'example_c'], 'string', 'max' => 255],
            [['lesson_id', 'word'], 'unique', 'targetAttribute' => ['lesson_id', 'word'], 'message' => 'The combination of Lesson ID and Word has already been taken.'],
            [['lesson_id', 'ordering'], 'unique', 'targetAttribute' => ['lesson_id', 'ordering'], 'message' => 'The combination of Lesson ID and Ordering has already been taken.'],
            [['lesson_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lessons::className(), 'targetAttribute' => ['lesson_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'lesson_id' => 'Lesson ID',
            'word' => 'Word',
            'definition' => 'Definition',
            'example_a' => 'Example A',
            'example_b' => 'Example B',
            'example_c' => 'Example C',
            'ordering' => 'Ordering',
            'is_deleted' => 'Is Deleted',
        ];
    }

    public function fields(){
        return [
            'id',
            'lesson_id',
            'word',
            'definition',
            'example_a',
            'example_b',
            'example_c',
            'ordering',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLesson()
    {
        return $this->hasOne(Lessons::className(), ['id' => 'lesson_id']);
    }
}
