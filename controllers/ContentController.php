<?php

namespace app\controllers;

use yii;
use yii\web\Controller;
use yii\data\ActiveDataProvider;
use app\models\Content;
use yii\helpers\Url;

class ContentController extends Controller
{
    public function beforeAction($action)
    {
        $this->layout = 'content.php';
        Yii::$app->response->format = \yii\web\Response::FORMAT_HTML;

        return parent::beforeAction($action);
    }

    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ]
        ];
    }

    public function actionIndex()
    {
        $lessons = Content::getLessons();

        return $this->render('lessons.php', [
            'lessons' => $lessons,
            'wordCount' => Content::getWordsCount()
        ]);
    }

    public function actionViewLesson()
    {
        $errors = $lesson_data = $form_data = [];
        $request = Yii::$app->request;

        if ($request->isPost) {

            $lesson_id = $request->post('lesson_id');
            $word = $form_data['word'] = trim($request->post('word'));
            $definition = $form_data['definition'] = trim($request->post('definition'));
            $example_a = $form_data['example_a'] = trim($request->post('example_a'));
            $example_b = $form_data['example_b'] = trim($request->post('example_b'));
            $example_c = $form_data['example_c'] = trim($request->post('example_c'));

            if (empty($lesson_id)) {
                die('Heyyy, do not hack (<strike>fuck</strike>) me vasya');
            }

            if (!Content::canIAddWordToLesson($lesson_id)) {
                $errors['no_more_place'] = 'This lesson is already fed up';
            } else {
                if (empty($word)) {
                    $errors['word'] = 'This field is necessary';
                }

                if (empty($definition)) {
                    $errors['definition'] = 'This field is necessary';
                }

                if (empty($example_a)) {
                    $errors['example_a'] = 'This field is necessary';
                }

                if (empty($example_b)) {
                    $errors['example_b'] = 'This field is necessary';
                }

                if (empty($example_c)) {
                    $errors['example_c'] = 'This field is necessary';
                }
            }

            if (empty($errors)) {
                $word_data = [
                    'lesson_id' => $lesson_id,
                    'word' => $word,
                    'definition' => $definition,
                    'example_a' => $example_a,
                    'example_b' => $example_b,
                    'example_c' => $example_c,
                    'ordering' => Content::getWordNextOrderWithinLesson($lesson_id)
                ];

                if (Content::addWord($word_data)) {
                    Yii::$app->session->setFlash('disclaimer', ['type' => 'success', 'message' => 'Word successfully added!']);
                }

                $this->redirect(Url::toRoute(['content/view-lesson', 'id' => $lesson_id], true));

            } else {
                $lesson_data = Content::getLessonData($lesson_id);

                return $this->render('words.php', [
                    'lesson_data' => $lesson_data,
                    'errors' => $errors,
                    'form_data' => $form_data
                ]);
            }
        } else {
            $id = (int)$request->get('id');

            if (!Content::isLessonExists($id)) {
                die('<h2>404 page not found</h2>');
            }

            $lesson_data = Content::getLessonData($id);

            return $this->render('words.php', ['lesson_data' => $lesson_data]);
        }
    }

    public function actionEditWord()
    {
        $request = Yii::$app->request;

        if ($request->isPost) {
            $id = $request->post('word_id');
        } else {
            $id = $request->get('id');
        }

        $word_data = Content::getWordById($id);

        if (!empty($word_data)) {
            if ($request->isPost) {

                $lesson_id = $request->post('lesson_id');
                $word_id = $request->post('word_id');

                $word = $form_data['word'] = trim($request->post('word'));
                $definition = $form_data['definition'] = trim($request->post('definition'));
                $example_a = $form_data['example_a'] = trim($request->post('example_a'));
                $example_b = $form_data['example_b'] = trim($request->post('example_b'));
                $example_c = $form_data['example_c'] = trim($request->post('example_c'));

                if (empty($word_id) || empty($lesson_id)) {
                    die('Heyyy, do not hack (<strike>fuck</strike>) me vasya');
                }

                if (empty($word)) {
                    $errors['word'] = 'This field is necessary';
                }

                if (empty($definition)) {
                    $errors['definition'] = 'This field is necessary';
                }

                if (empty($example_a)) {
                    $errors['example_a'] = 'This field is necessary';
                }

                if (empty($example_b)) {
                    $errors['example_b'] = 'This field is necessary';
                }

                if (empty($example_c)) {
                    $errors['example_c'] = 'This field is necessary';
                }

                if (empty($errors)) {
                    $word_data = [
                        'word' => $word,
                        'definition' => $definition,
                        'example_a' => $example_a,
                        'example_b' => $example_b,
                        'example_c' => $example_c,
                    ];

                    if (Content::editWord($word_data, $word_id)) {
                        Yii::$app->session->setFlash('disclaimer', ['type' => 'success', 'message' => 'Word successfully updated!']);
                    }

                    $this->redirect(Url::toRoute(['content/view-lesson', 'id' => $lesson_id], true));
                } else {
                    $word_data['word'] = $word;
                    $word_data['definition'] = $definition;
                    $word_data['example_a'] = $example_a;
                    $word_data['example_b'] = $example_b;
                    $word_data['example_c'] = $example_c;

                    return $this->render('edit-word.php', [
                        'word_data' => $word_data,
                        'errors' => $errors
                    ]);
                }
            }

            return $this->render('edit-word.php', ['word_data' => $word_data]);
        } else {
            die('<h3>This word doesn\'t exist</h3>');
        }
    }

    public function actionRemoveWord()
    {
        $request = Yii::$app->request;

        if ($request->isPost) {
            $word_id = $request->post('word_id');

            $disclaimer_data = [
                'type' => 'info',
                'message' => 'Defailt message'
            ];

            if ($word_id) {
                if (Content::removeWord($word_id)) {
                    $disclaimer_data['type'] = 'success';
                    $disclaimer_data['message'] = 'Word has been removed';
                } else {
                    $disclaimer_data['type'] = 'danger';
                    $disclaimer_data['message'] = 'Woah! I couldn\'t remove that word';
                };

                Yii::$app->session->setFlash('disclaimer', $disclaimer_data);
            }

            $this->redirect($request->referrer);
        }
    }

    public function actionHelp()
    {
        return $this->render('help.php');
    }
}
