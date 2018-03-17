<template lang="pug">
nav.panel
  .panel-heading
    .title.is-6 タグ・ランキング
  .panel-tabs
    a.is-active 週間
    a 月間
    a 全て
  .panel-block(v-for='(tag, index) in tags')
    tag-media(:rank="index+1",
              :tag-image-src='tagImageSrcs[index]',
              :tagname="tag.name",
              :posts="tag.post_taggings_count")
</template>

<script>
import TagMedia from '@/components/atoms/media_object/TagMedia.vue'
import { tag } from '@/api/index'

export default {
  components: {
    TagMedia
  },
  data() {
    return {
      // TODO: このやり方は一時しのぎであって実際はDBから取得するようにしたい
      tagImageSrcs: [
        require("@/assets/home/tag/Python.jpg"),
        require("@/assets/home/tag/JavaScript.jpg"),
        require("@/assets/home/tag/Ruby.jpg"),
        require("@/assets/home/tag/AWS.jpg"),
        require("@/assets/home/tag/Android.jpg"),
        require("@/assets/home/tag/Docker.png"),
        require("@/assets/home/tag/Swift.png"),
        require("@/assets/home/tag/iOS.png"),
        require("@/assets/home/tag/Rails.jpg"),
        require("@/assets/home/tag/PHP.jpg")
      ],
      tags: []
    }
  },
  mounted() {
    this.fetchTags()
  },
  methods: {
    fetchTags() {
      tag.index().then(response => {
        response.data.forEach( (tag, index) => {
          var result = { name: tag.name, post_taggings_count: tag.post_taggings_count }
          this.tags.push(result)
        })
      }).catch(error => {
        console.error(error)
      })
    }
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

.panel-block
  background-color: white
</style>