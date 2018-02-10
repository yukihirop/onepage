<template lang="pug">
.panel-block
  .m-post-with-like-media-left
    .m-post-with-like-media-left-image
      figure.image.is-64x64
        img(:src='profileImageSrc', alt='Placeholder image')
  .m-post-with-like-media-right
    .m-post-with-like-media-right-action
      .panel-icon
        i.fa.fa-thumbs-o-up.fa-2x.action
      .m-post-with-like-media-right-action-message
        b.m-post-with-like-media-right-action-message-who {{ who }}
        |  が 
        b.m-post-with-like-media-right-action-message-what いいね
        |  しました
      .m-post-with-like-media-right-action-when
        b {{ when }}
    post-content-media(:title='title', :organization='organization', :summary='summary')

</template>

<script>
import PostContentMedia from '../../atoms/media_object/PostContentMedia.vue'

export default {
  components: {
    PostContentMedia
  },
  props: {
    profileImageSrc: {
      type: String,
      required: true
    },
    who: {
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
  data () {
    return {
      src: require(this.profileImageSrc)
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

.m-post-with-like-media-left
  display: flex
  align-items: center
  background-color: $custome_white
  color: $theme_color

  &-image
    width: 100px
    figure
      padding-top: 10px
      padding-left: 10px

.m-post-with-like-media-right
  display: flex
  flex-direction: column
  align-items: stretch
  text-align: left
  background-color: white
  width: 100%

  &-action
    display: flex
    flex-direction: row nowrap
    align-items: center
    padding: 1.0em
    padding-bottom: 0em
    position: relative

    &-message
      color: gray

      &-who
        padding-left: 0.5em

    &-when
      position: abusolute
      margin: auto
      margin-right: 0
</style>