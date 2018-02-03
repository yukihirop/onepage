<template lang="pug">
.panel-block
  .user-content(style="padding-bottom: 0px;")
    .user-rank
      p(style="margin-top: 10px;") {{ rank }}
    .user-image(style="width: 64px;")
      img(:src='profileImageSrc', style="width: 32px;margin-top: 10px;")
    .user-name
      b
        | {{ username }}
        br
        small
          a @{{ mentionname }}
    .user-likes
      .user-likes-icon
        span.panel-icon
          i.fa.fa-thumbs-o-up(style="margin-top: 10px;")
      .user-likes-likes
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
  data() {
    return {
      src: require(this.profileImageSrc)
    }
  }
}
</script>

<style scoped lang="stylus">
.panel-block
  background-color: white
  padding-top: 0
  padding-bottom: 0
  margin-top: 0
  margin-bottom: 0

.user-content
  display: flex
  flex-direction: row
  align-items: center
  justify-content: space-between
  width: 100%
  
  .user-rank
    width: 20px
  
  .user-name
    width:100px
    text-align: left
    padding-top: 10px
    padding-bottom: 10px
  
  .user-likes
    display: flex
    flex-direction: column
    align-items: center
    margin-left: auto
    
    .user-likes-icon
      width: 50px
      text-align: left
    .user-likes-likes
      width: 50px
      text-align:left
</style>