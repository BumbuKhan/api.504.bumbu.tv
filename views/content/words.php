<?php
use yii\helpers\Url;

?>

    <h3>Words in <?= $lesson_data['lesson']['title'] ?></h3>
<?php
if (Yii::$app->session->hasFlash('disclaimer')) {
    $disclaimer = Yii::$app->session->getFlash('disclaimer');
    ?>
    <div class="alert alert-<?= $disclaimer['type'] ?>" role="alert">
        <?= $disclaimer['message'] ?>
    </div>
<?php }

if ($errors['no_more_place']) { ?>
    <div class="alert alert-danger" role="alert">
        This lesson is already fed up (there are already 12 words)
    </div>
    <?
}
?>
<?php
if (empty($lesson_data['words'])) {
    ?>
    <div class="alert alert-info" role="alert" style="margin-bottom: 0;">
        There is no word here :-(
    </div>
<?php } else { ?>
    <ul class="list-group">
        <?php foreach ($lesson_data['words'] as $i => $word) { ?>
            <li class="list-group-item">
                <?= ++$i ?>. <b><?= $word['word'] ?></b> - <?= $word['definition'] ?>
                <hr>
                <ul class="word-examples">
                    <li><?= $word['example_a'] ?></li>
                    <li><?= $word['example_b'] ?></li>
                    <li><?= $word['example_c'] ?></li>
                </ul>

                <hr style="margin: 10px 0 15px 0">

                <div class="btn-group btn-group-sm btn-group-justified" role="group" aria-label="Justified button group">
                    <a href="#" class="btn btn-default remove-word" role="button" data-word-id="<?=$word['id']?>">
                        <span style="color: red;">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;&nbsp;Remove
                        </span>
                    </a>
                    <a href="<?= Url::toRoute(['content/edit-word', 'id' => $word['id']], true) ?>" class="btn btn-default" role="button">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;&nbsp;Edit</a>
                </div>
            </li>
        <?php } ?>
    </ul>
<?php } ?>


<!--form to remove word start-->
<form action="<?= Url::toRoute(['content/remove-word'], true) ?>" method="post" id="form-remove-word">
    <input type="hidden" name="<?= Yii::$app->request->csrfParam ?>" value="<?= Yii::$app->request->csrfToken ?>">
    <input type="hidden" name="word_id" value="">
</form>
<!--form to remove word   end-->

<?php if (count($lesson_data['words']) < 12) { ?>

    <br>
    <hr>

    <h4>Add a new word to this lesson</h4>

    <form action="<?= Url::toRoute(['content/view-lesson'], true) ?>" method="post">
        <input type="hidden" name="<?= Yii::$app->request->csrfParam ?>" value="<?= Yii::$app->request->csrfToken ?>">
        <input type="hidden" name="lesson_id" value="<?= $lesson_data['lesson']['id'] ?>">

        <div class="form-group <?= (($errors['word']) ? 'has-error' : '') ?>">
            <label for="word">Word</label>
            <input type="text" name="word" class="form-control" id="word" value="<?= $form_data['word'] ?>">
            <p class="help-block"><?= (($errors['word']) ? $errors['word'] : '') ?></p>
        </div>
        <div class="form-group <?= (($errors['definition']) ? 'has-error' : '') ?>">
            <label for="definition">Definition</label>
            <textarea name="definition" class="form-control" rows="3"
                      id="definition"><?= $form_data['definition'] ?></textarea>
            <p class="help-block"><?= (($errors['definition']) ? $errors['definition'] : '') ?></p>
        </div>
        <div class="form-group <?= (($errors['example_a']) ? 'has-error' : '') ?>">
            <label for="example_a">Example a</label>
            <textarea name="example_a" class="form-control" rows="3"
                      id="example_a"><?= $form_data['example_a'] ?></textarea>
            <p class="help-block"><?= (($errors['example_a']) ? $errors['example_a'] : '') ?></p>
        </div>
        <div class="form-group <?= (($errors['example_b']) ? 'has-error' : '') ?>">
            <label for="example_b">Example b</label>
            <textarea name="example_b" class="form-control" rows="3"
                      id="example_b"><?= $form_data['example_b'] ?></textarea>
            <p class="help-block"><?= (($errors['example_b']) ? $errors['example_b'] : '') ?></p>
        </div>
        <div class="form-group <?= (($errors['example_c']) ? 'has-error' : '') ?>">
            <label for="example_c">Example c</label>
            <textarea name="example_c" class="form-control" rows="3"
                      id="example_c"><?= $form_data['example_c'] ?></textarea>
            <p class="help-block"><?= (($errors['example_c']) ? $errors['example_c'] : '') ?></p>
        </div>

        <button type="submit" class="btn btn-primary btn-block">Submit</button>
    </form>

    <br>
<?php } ?>

<script>
    $(document).ready(function () {
        var formRemoveWord = $('#form-remove-word');
        var wordIdInput = $('[name="word_id"]');

        $('.remove-word').on('click', function (e) {
            e.preventDefault();
            var wordId = $(this).attr('data-word-id');
            wordIdInput.attr('value', wordId);

            if(confirm('Are you sure that you wanna delete this one?')){
                formRemoveWord.submit();
            }
        })
    });
</script>
