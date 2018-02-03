<template lang="pug">
.panel-block
  .post-left
    .post-image
      figure.image.is-64x64
        img(:src='profileImageSrc', alt='Placeholder image')
  .post-right
    .post-action
      figure.image.is-16x16
        img(:src='tagImageSrc', alt='Placeholder image')
      .post-message
        b.post-tag {{ tag }}
        |  に新しい投稿がありました。
      .post-when
        b {{ when }}
    post-content(:title='title', :organization='organization', :summary='summary')
</template>

<script>
import PostContent from './shared/PostContent.vue'

export default {
  components: {
    PostContent
  },
  props: {
    profileImageSrc: {
      type: String,
      required: true
    },
    tagImageSrc: {
      type: String,
      required: true
    },
    tag: {
      type: String,
      required: true
    },
    when: {
      type: String,
      required: true
    },
    title: {
      type: String,
      required: true
    },
    organization: {
      type: String,
      required: false
    },
    summary: {
      type: String,
      required: true
    }
  },
  data(){
    return {
      src: require(this.profileImageSrc),
      src: require(this.tagImageSrc)
    }
  }
}
</script>

<style scoped lang="stylus">
$custome_white = #F8F8F8
$custome_gray  = #CCCCCC
$organization_color = #8E8E8E
$theme_color = #0081C1

div
  padding: 0
  margin: 0

ul
  padding: 0
  margin: 0
  li
    margin-bottom: 5px

.panel-block
  display: inline-flex
  flex-direction: row
  align-items: stretch


.post-left
  display: flex
  align-items: center
  background-color: $custome_white
  color: $theme_color


.post-image
  width: 100px
  figure
    padding-top: 10px
    padding-left: 10px


.post-right
  display: flex
  flex-direction: column
  align-items: stretch
  text-align: left
  background-color: white
  width: 100%

  .post-action
    display: flex
    flex-direction: row nowrap
    align-items: center
    padding: 1.0em
    padding-bottom: 0em
    position: relative

    .post-message
      color: gray

      .post-tag
        padding-left: 0.5em

    .post-when
      position: abusolute
      margin: auto
      margin-right: 0
</style>