<template lang="pug">
.a-tag-media
  .a-tag-media-rank
    p(style="margin-top: 10px;") {{ rank }}
  .a-tag-media-image(style="width: 64px;")
    img(:src='tagImageSrc', style="width: 32px;margin-top: 10px;")
  .a-tag-media-name
    b
      | {{ tagname }}
  .a-tag-media-post
    .a-tag-media-post-posts
      b {{ posts }}
    .a-tag-media-post-label
      small posts
</template>

<script>
export default {
  props: {
    rank: {
      type: Number,
      required: true
    },
    tagImageSrc: {
      type: String,
      required: true
    },
    tagname: {
      type: String,
      required: true
    },
    posts: {
      type: Number,
      required: true
    }
  },
  // https://kuroeveryday.blogspot.jp/2017/10/img-src-data-binding-vuejs.html
  data () {
    return {
      src: require(this.a - tag - mediaImageSrc)
    }
  }
}
</script>

<style scoped lang="stylus">
.a-tag-media
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
  
  &-post
    display: flex
    flex-direction: column
    align-items: center
    margin-left: auto
    
    &-posts
      width: 50px
      text-align: left
    &-label
      width: 50px
      text-align:left
</style>