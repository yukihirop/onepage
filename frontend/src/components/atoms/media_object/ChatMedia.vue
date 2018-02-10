<template lang="pug">
.panel-block
  .a-chat-media-left
    .a-chat-media-image
      figure.image.is-64x64
        img(:src='profileImageSrc', alt='Placeholder image')
  .a-chat-media-right
    .a-chat-media-right-action
      .panel-icon
        i.fa.fa-comment.fa-2x.action
      .a-chat-media-right-action-message
        b.a-chat-media-right-action-message-who {{ who }}
        |  が 
        b.a-chat-media-right-action-message-what コメント
        |  しました
      .a-chat-media-right-action-when
        b {{ when }}
    .a-chat-media-right-comment
      div
        p
          | {{ comment }}
    .a-chat-media-right-reference
      div
        h3 
          b To: {{ refTitle }}
      .a-chat-media-right-reference-panel-icon
        i.fa.fa-comments
      div
        | {{ refComments }}
</template>

<script>
export default {
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
    comment: {
      type: String,
      required: true
    },
    refTitle: {
      type: String,
      required: true
    },
    refComments: {
      type: Number,
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

.a-chat-media-left
  display: flex
  align-items: center
  background-color: $custome_white
  color: $theme_color

.a-chat-media-image
  width: 100px
  figure
    padding-top: 10px
    padding-left: 10px

.a-chat-media-right
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
    position: relative

    &-message
      color: gray

      &-who
        padding-left: 0.5em

    &-when
      position: abusolute
      margin: auto
      margin-right: 0

  &-comment
    padding-left: 1.5em
    padding-right: 1.5em
    div
      background-color: $custome_white
      p
        padding: 0.5em

  &-reference
    display: flex
    flex-direction: row
    align-items: center
    padding-top: 1.0em
    padding-bottom: 0.5em
    padding-left: 1.0em
    padding-right: 1.5em

    &-panel-icon
      padding-left: 1.0em
    div
      padding-left: 1.25em
</style>