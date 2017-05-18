<?php
namespace app\controllers;

use yii\rest\ActiveController;
use yii\data\ActiveDataProvider;
use app\models\Lessons;

class LessonController extends ActiveController
{
    public $modelClass = 'app\models\Lessons';
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];

    public function actions(){
        $actions = parent::actions();
        unset($actions['index']);
        return $actions;
    }

    public function actionIndex(){
        $activeData = new ActiveDataProvider([
            'query' => Lessons::find(),
            'pagination' => false
        ]);
        return $activeData;
    }
}