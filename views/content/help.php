<?php
use yii\helpers\Url;
?>
<h3 style="margin-top: 0;">How to fill up?</h3>

<p>Actually there are only two things you should bare in mind while filling up <b>'Example a'</b>, <b>'Example b'</b> and <b>'Example c'</b> fields</p>
<br>
<p><b>1. Wrap word in a single asterisk</b> (*like this*) if that word is used for current word, that will make it <b>bold</b>
    <img src="<?=Url::base(true)?>/img/img_1.jpg" alt="" class="img-responsive">
</p>

<br>
<p><b>2. Wrap word in a double asterisk</b> (**like this**) if that word is from one of th previous lesson (or perhaps from current), that will make it <span style="text-decoration: underline"><b>bold and underlined</b></span>
    <img src="<?=Url::base(true)?>/img/img_2.jpg" alt="" class="img-responsive">

</p>