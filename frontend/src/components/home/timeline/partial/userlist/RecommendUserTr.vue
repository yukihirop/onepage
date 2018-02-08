<template lang="pug">
.panel-block
  article.media
    figure.media-left.recommend-user-content
      p.image.is-32x32
        img(:src='profileImageSrc')
    .media-content
      .content
        p
          strong.recommend-user-name {{ username }}
          a.recommend-user-mention @{{ mentionname }}
          br.reccomend-user-content
          | {{ introduction }}
    .media-right
      button.button.is-small.recommend-user-follow フォロー
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
    introduction: {
      type: String,
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
$theme_color = #0081C1

article.media
  display: flex
  flex-direction: row
  justify-content: space-between
  width: 100%

a.recommend-user-mention
  color: $theme_color

.panel-block
  background-color: white
  
  .media-content
    margin: auto
  
  .recommend-user-follow
    margin-right: 0
    color: white
    background-color: $theme_color
</style>