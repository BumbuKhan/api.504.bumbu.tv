<?php
use yii\helpers\Url;
?>

<h3>Lessons</h3>

<?php
if (!empty($lessons)) { ?>
    <div class="list-group">
        <?php foreach ($lessons as $lesson) { ?>
            <a href="<?=Url::toRoute(['content/view-lesson', 'id' => $lesson['id']], true)?>" type="button" class="list-group-item"><b><?=$lesson['title']?></b>
                <span class="glyphicon glyphicon-chevron-right pull-right" style="margin-left: 10px;"></span>
                <span class="badge <?=(($lesson['words_count'] == '12')? 'lesson__filled-up' : '')?>"><?=$lesson['words_count']?></span>
            </a>
        <?php } ?>
    </div>
<?php } ?>


