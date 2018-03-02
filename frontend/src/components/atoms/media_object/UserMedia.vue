<template lang="pug">
.a-user-media(style="padding-bottom: 0px;")
  .a-user-media-rank
    p(style="margin-top: 10px;") {{ rank }}
  .a-user-media-image(style="width: 64px;")
    img(:src='profileImageSrc', style="width: 32px;margin-top: 10px;")
  .a-user-media-name
    b
      | {{ username }}
      br
      small
        a @{{ mentionname }}
  .a-user-media-likes
    .a-user-media-likes-icon
      span.panel-icon
        i.fa.fa-thumbs-o-up(style="margin-top: 10px;")
    .a-user-media-likes-likes
      b {{ likes }}
</template>

<script>
export default {
  props: {
    rank: {
      type: Number,
      required: true
    },
    profileImageSrc: {
      type: String,
      required: true
    },
    username: {
      type: String,
      required: true
    },
    mentionname: {
      type: String,
      required: true
    },
    likes: {
      type: Number,
      required: true
    }
  },
  // https://kuroeveryday.blogspot.jp/2017/10/img-src-data-binding-vuejs.html
  data () {
    return {
      src: require(this.profileImageSrc)
    }
  }
}
</script>

<style scoped lang="stylus">
$theme_color = #0081C1

.a-user-media
  display: flex
  flex-direction: row
  align-items: center
  justify-content: space-between
  width: 100%
  
  &-rank
    width: 20px
  
  &-name
    width:100px
    text-align: left
    padding-top: 10px
    padding-bottom: 10px
    
    a
      color: $theme_color
  
  &-likes
    display: flex
    flex-direction: column
    align-items: center
    margin-left: auto
    
    &-icon
      width: 50px
      text-align: left
    &-likes
      width: 50px
      text-align: left
</style>