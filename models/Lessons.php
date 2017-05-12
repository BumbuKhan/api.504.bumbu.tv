<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "lessons".
 *
 * @property integer $id
 * @property string $title
 * @property integer $ordering
 *
 * @property Words[] $words
 */
class Lessons extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'lessons';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'ordering'], 'required'],
            [['ordering'], 'integer'],
            [['title'], 'string', 'max' => 100],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'ordering' => 'Ordering',
        ];
    }

    public function extraFields()
    {
        return ['words'];
    }

    public function getWords()
    {
        return $this->hasMany(Words::className(), ['lesson_id' => 'id']);
    }
}
