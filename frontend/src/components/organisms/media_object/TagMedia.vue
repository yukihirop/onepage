<template lang="pug">
nav.panel
  .panel-heading
    .title.is-6 タグ・ランキング
  .panel-tabs
    a.is-active 週間
    a 月間
    a 全て
  tag-media(rank=1, :tag-image-src='require("../../../assets/home/tag/Python.jpg")', tagname='Python',     posts=99999)
  tag-media(rank=2, :tag-image-src='require("../../../assets/home/tag/JavaScript.jpg")', tagname='JavaScript', posts=9999)
  tag-media(rank=3, :tag-image-src='require("../../../assets/home/tag/Ruby.jpg")', tagname='Ruby',       posts=8888)
  tag-media(rank=4, :tag-image-src='require("../../../assets/home/tag/AWS.jpg")', tagname='AWS',        posts=7777)
  tag-media(rank=5, :tag-image-src='require("../../../assets/home/tag/Android.jpg")', tagname='Android',    posts=6666)
  tag-media(rank=6, :tag-image-src='require("../../../assets/home/tag/Docker.png")', tagname='Docker',     posts=5555)
  tag-media(rank=7, :tag-image-src='require("../../../assets/home/tag/Swift.png")', tagname='Swift',      posts=4444)
  tag-media(rank=8, :tag-image-src='require("../../../assets/home/tag/iOS.png")', tagname='iOS',        posts=333)
  tag-media(rank=9, :tag-image-src='require("../../../assets/home/tag/Rails.jpg")', tagname='Rails',      posts=22)
  tag-media(rank=10,:tag-image-src='require("../../../assets/home/tag/PHP.jpg")', tagname='PHP',       posts=1)
</template>

<script>
import TagMedia from '@/components/atoms/media_object/TagMedia.vue'

export default {
  components: {
    TagMedia
  }
}
</script>

<style scoped lang="stylus">
$custome_white = #F8F8F8
$theme_color = #0081C1

nav.panel
  a
    color: $theme_color
    .is-active
      color: dark

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