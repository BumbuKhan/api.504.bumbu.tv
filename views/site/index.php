<?php
use yii\helpers\Url;

?>

<h1>Documentation</h1>
<hr>
<code>[<?=Url::base(true)?>/lessons]</code> - will return all available lessons divided by pagination <br>
<code>[<?=Url::base(true)?>/lessons/1]</code> - will return only the first lesson's data (!WITHOUT WORDS) <br>
<code>[<?=Url::base(true)?>/lessons/1?expand=words]</code> - will return all words which contain in lesson 1 along with it's data <br>
<code>[<?=Url::base(true)?>/words]</code> - will return all words available divided by pagination <br>
<code>[<?=Url::base(true)?>/words/1]</code> - will return only the first word's data <br>
