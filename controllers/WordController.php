<?php
namespace app\controllers;

use yii\rest\ActiveController;
use yii\data\ActiveDataProvider;
use app\models\Words;

class WordController extends ActiveController
{
    public $modelClass = 'app\models\Words';
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => false,
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

    public function actionIndex()
    {
        $activeData = new ActiveDataProvider([
            'query' => Words::find(),
            'pagination' => false
        ]);
        return $activeData;
    }
}
