<?php
use yii\helpers\Url;

?>

<h1>Documentation</h1>
<hr>
<code>[<a href="<?=Url::base(true)?>/lessons" target="_blank"><?=Url::base(true)?>/lessons</a>]</code> - will return all available lessons divided by pagination <br>
<code>[<a href="<?=Url::base(true)?>/lessons/1" target="_blank"><?=Url::base(true)?>/lessons/1</a>]</code> - will return only the first lesson's data (!WITHOUT WORDS) <br>
<code>[<a href="<?=Url::base(true)?>/lessons/1?expand=words" target="_blank"><?=Url::base(true)?>/lessons/1?expand=words</a>]</code> - will return all words which are contained in lesson 1 along with it's data <br>
<code>[<a href="<?=Url::base(true)?>/words" target="_blank"><?=Url::base(true)?>/words</a>]</code> - will return all words available divided by pagination <br>
<code>[<a href="<?=Url::base(true)?>/words/1" target="_blank"><?=Url::base(true)?>/words/1</a>]</code> - will return only the first word's data <br>
