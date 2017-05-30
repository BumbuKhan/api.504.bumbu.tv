<?php
use yii\helpers\Url;
?>


<h3 style="margin-top: 0;">Progress</h3>
<div class="row">
    <div class="col-xs-6" style="text-align: center; padding: 8px 0; border: 1px #e0e0e0 solid; border-left: none">
        <div id="circle">
            <strong><?=ceil($wordCount/(12 * 42))?>%</strong>
        </div>
    </div>
    <div class="col-xs-6" style="text-align: center; padding: 8px 0; border: 1px #e0e0e0 solid; border-right: none; border-left: none">
        <div id="circle1">
            <strong><?=$wordCount?>/504</strong>
        </div>
    </div>
</div>
<script>
    $('#circle').circleProgress({
        value: <?=$wordCount/(12 * 42)?>,
        size: 100,
        fill: { color: "#f4613c" },
        lineCap: 'round'
    });

    $('#circle1').circleProgress({
        value: <?=$wordCount/(504)?>,
        size: 100,
        fill: {color: "#65a7f8"},
        lineCap: 'round'
    });
</script>

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


