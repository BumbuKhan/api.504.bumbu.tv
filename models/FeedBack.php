<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "feed_back".
 *
 * @property integer $id
 * @property string $message
 * @property string $phone_data
 * @property string $add_datetime
 */
class FeedBack extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'feed_back';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['message', 'phone_data', 'add_datetime'], 'required'],
            [['message', 'phone_data'], 'string'],
            [['add_datetime'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'message' => 'Message',
            'phone_data' => 'Phone Data',
            'add_datetime' => 'Add Datetime',
        ];
    }

    public static function add($data)
    {
        Yii::$app->db->createCommand()->insert('feed_back', $data)->execute();
    }
}
