<template lang="pug">
nav.panel
  .panel-heading
    .title.is-6 タグ・ランキング
  .panel-tabs
    a.is-active 週間
    a 月間
    a 全て
  tag-tr(rank=1, :tag-image-src='require("../../../../assets/home/tag/Python.jpg")', tagname='Python',     posts=99999)
  tag-tr(rank=2, :tag-image-src='require("../../../../assets/home/tag/JavaScript.jpg")', tagname='JavaScript', posts=9999)
  tag-tr(rank=3, :tag-image-src='require("../../../../assets/home/tag/Ruby.jpg")', tagname='Ruby',       posts=8888)
  tag-tr(rank=4, :tag-image-src='require("../../../../assets/home/tag/AWS.jpg")', tagname='AWS',        posts=7777)
  tag-tr(rank=5, :tag-image-src='require("../../../../assets/home/tag/Android.jpg")', tagname='Android',    posts=6666)
  tag-tr(rank=6, :tag-image-src='require("../../../../assets/home/tag/Docker.png")', tagname='Docker',     posts=5555)
  tag-tr(rank=7, :tag-image-src='require("../../../../assets/home/tag/Swift.png")', tagname='Swift',      posts=4444)
  tag-tr(rank=8, :tag-image-src='require("../../../../assets/home/tag/iOS.png")', tagname='iOS',        posts=333)
  tag-tr(rank=9, :tag-image-src='require("../../../../assets/home/tag/Rails.jpg")', tagname='Rails',      posts=22)
  tag-tr(rank=10,:tag-image-src='require("../../../../assets/home/tag/PHP.jpg")', tagname='PHP',       posts=1)
</template>

<script>
import TagTr from './tr/Tag.vue'

export default {
  components: {
    TagTr
  }
}
</script>

<style scoped lang="stylus">
$custome_white = #F8F8F8
$theme_color = #0081C1

.panel-heading
  margin-bottom: 0px
  background-color: $theme_color
  .title
    color: white
.panel-tabs
  padding-bottom: 0px
  margin-bottom: 0px
  background-color: $custome_white
</style>