<?php
namespace app\controllers;

use yii\rest\ActiveController;

class LessonController extends ActiveController
{
    public $modelClass = 'app\models\Lessons';
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];
}