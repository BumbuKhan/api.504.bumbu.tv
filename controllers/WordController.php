<?php
namespace app\controllers;

use yii\rest\ActiveController;

class WordController extends ActiveController
{
    public $modelClass = 'app\models\Words';
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];
}
