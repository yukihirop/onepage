<template lang="pug">
nav.panel
  p.panel-heading
    | タグ・ランキング
  p.panel-tabs
    a.is-active 週間
    a 月間
    a 全て
  table.table(style="width: 320px;")
    tbody(style="height: 64px")
      tag-tr(rank=1, imageSrc='https://bulma.io/images/placeholders/32x32.png', tagname='Python',     posts=99999)
      tag-tr(rank=2, imageSrc='https://bulma.io/images/placeholders/32x32.png', tagname='JavaScript', posts=9999)
      tag-tr(rank=3, imageSrc='https://bulma.io/images/placeholders/32x32.png', tagname='Ruby',       posts=8888)
      tag-tr(rank=4, imageSrc='https://bulma.io/images/placeholders/32x32.png', tagname='AWS',        posts=7777)
      tag-tr(rank=5, imageSrc='https://bulma.io/images/placeholders/32x32.png', tagname='Android',    posts=6666)
      tag-tr(rank=6, imageSrc='https://bulma.io/images/placeholders/32x32.png', tagname='Docker',     posts=5555)
      tag-tr(rank=7, imageSrc='https://bulma.io/images/placeholders/32x32.png', tagname='Swift',      posts=4444)
      tag-tr(rank=8, imageSrc='https://bulma.io/images/placeholders/32x32.png', tagname='iOS',        posts=333)
      tag-tr(rank=9, imageSrc='https://bulma.io/images/placeholders/32x32.png', tagname='Rails',      posts=22)
      tag-tr(rank=10, imageSrc='https://bulma.io/images/placeholders/32x32.png', tagname='PHP',       posts=1)
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
.panel-heading
  padding-bottom: 0px
  margin-bottom: 0px
.panel-tabs
  padding-bottom: 0px
  margin-bottom: 0px
</style>