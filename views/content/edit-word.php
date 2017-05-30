<?php
use yii\helpers\Url;
?>

<h4>Edit word</h4>

<form action="<?= Url::toRoute(['content/edit-word'], true) ?>" method="post">
    <input type="hidden" name="<?= Yii::$app->request->csrfParam ?>" value="<?= Yii::$app->request->csrfToken ?>">
    <input type="hidden" name="word_id" value="<?= $word_data['id'] ?>">
    <input type="hidden" name="lesson_id" value="<?= $word_data['lesson_id'] ?>">

    <div class="form-group <?= (($errors['word']) ? 'has-error' : '') ?>">
        <label for="word">Word</label>
        <input type="text" name="word" class="form-control" id="word" value="<?= $word_data['word'] ?>">
        <p class="help-block"><?= (($errors['word']) ? $errors['word'] : '') ?></p>
    </div>
    <div class="form-group <?= (($errors['definition']) ? 'has-error' : '') ?>">
        <label for="definition">Definition</label>
        <textarea name="definition" class="form-control" rows="3"
                  id="definition"><?= $word_data['definition'] ?></textarea>
        <p class="help-block"><?= (($errors['definition']) ? $errors['definition'] : '') ?></p>
    </div>
    <div class="form-group <?= (($errors['example_a']) ? 'has-error' : '') ?>">
        <label for="example_a">Example a</label>
        <textarea name="example_a" class="form-control" rows="3"
                  id="example_a"><?= $word_data['example_a'] ?></textarea>
        <p class="help-block"><?= (($errors['example_a']) ? $errors['example_a'] : '') ?></p>
    </div>
    <div class="form-group <?= (($errors['example_b']) ? 'has-error' : '') ?>">
        <label for="example_b">Example b</label>
        <textarea name="example_b" class="form-control" rows="3"
                  id="example_b"><?= $word_data['example_b'] ?></textarea>
        <p class="help-block"><?= (($errors['example_b']) ? $errors['example_b'] : '') ?></p>
    </div>
    <div class="form-group <?= (($errors['example_c']) ? 'has-error' : '') ?>">
        <label for="example_c">Example c</label>
        <textarea name="example_c" class="form-control" rows="3"
                  id="example_c"><?= $word_data['example_c'] ?></textarea>
        <p class="help-block"><?= (($errors['example_c']) ? $errors['example_c'] : '') ?></p>
    </div>

    <button type="submit" class="btn btn-primary btn-block">Save changes</button>
</form>

<br>