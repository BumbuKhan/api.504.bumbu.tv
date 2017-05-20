<?php
namespace app\controllers;

use yii;
use yii\rest\ActiveController;
use app\models\FeedBack;

class FeedBackController extends ActiveController
{
    public $modelClass = 'app\models\FeedBack';
    public $serializer = [
        'class' => 'yii\rest\Serializer',
    ];

    public function behaviors()
    {
        $behaviors = parent::behaviors();

        // add CORS filter
        $behaviors['corsFilter'] = [
            'class' => \yii\filters\Cors::className(),
        ];

        return $behaviors;
    }

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['index']);
        return $actions;
    }

    public function actionAdd()
    {
        $request = Yii::$app->request;
        $post_data = $request->post();

        FeedBack::add($post_data);
    }
}
