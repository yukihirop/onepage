<template lang="pug">
.panel-block
  .tag-content
    .tag-rank
      p(style="margin-top: 10px;") {{ rank }}
    .tag-image(style="width: 64px;")
      img(:src='tagImageSrc', style="width: 32px;margin-top: 10px;")
    .tag-name
      b
        | {{ tagname }}
    .tag-post
      .tag-post-posts
        b {{ posts }}
      .tag-post-label
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
  data() {
    return {
      src: require(this.tagImageSrc)
    }
  }
}
</script>

<style scoped lang="stylus">
.panel-block
  background-color: white

.tag-content
  display: flex
  flex-direction: row
  align-items: center
  justify-content: space-between
  width: 100%
  
  .tag-rank
    width: 20px
  
  .tag-name
    width:100px
    text-align: left
    padding-top: 10px
    padding-bottom: 10px
  
  .tag-post
    display: flex
    flex-direction: column
    align-items: center
    margin-left: auto
    
    .tag-post-posts
      width: 50px
      text-align: left
    .tag-post-label
      width: 50px
      text-align:left
</style>