<template lang="pug">
.panel-block
  .chat-left
    .chat-image
      figure.image.is-64x64
        img(src='https://bulma.io/images/placeholders/64x64.png', alt='Placeholder image')
  .chat-right
    .chat-action
      .panel-icon
        i.fa.fa-comment.fa-2x.action
      .chat-message
        b.who {{ who }}
        |  が 
        b.what コメント
        |  しました
      .chat-when
        b {{ when }}
    .chat-comment
      div
        p
          | {{ comment }}
    .chat-reference
      div
        h3 
          b To: {{ refTitle }}
      .panel-icon
        i.fa.fa-comments.fa-4x
      div
        | {{ refComments }}
</template>

<script>
export default {
  props: {
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

.chat-left
  display: flex
  align-items: center
  background-color: $custome_white
  color: $theme_color

.chat-image
  width: 100px
  figure
    padding-top: 10px
    padding-left: 10px

.chat-right
  display: flex
  flex-direction: column
  align-items: stretch
  text-align: left
  background-color: white
  width: 100%

  .chat-action
    display: flex
    flex-direction: row nowrap
    align-items: center
    padding: 1.0em
    position: relative

    .chat-message
      color: gray

      .who
        padding-left: 0.5em

    .chat-when
      position: abusolute
      margin: auto
      margin-right: 0

  .chat-comment
    padding-left: 1.5em
    padding-right: 1.5em
    div
      background-color: $custome_white
      p
        padding: 0.5em

  .chat-reference
    display: flex
    flex-direction: row
    align-items: center
    padding-top: 1.0em
    padding-bottom: 0.5em
    padding-left: 1.0em
    padding-right: 1.5em

    .panel-icon
      padding-left: 1.0em
    div
      padding-left: 1.25em
</style>