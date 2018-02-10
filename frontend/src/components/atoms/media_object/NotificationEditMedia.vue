<template lang="pug">
.panel-block
  article.media
    figure.media-left
      p.image.is-32x32
        img(:src='profileImageSrc', alt="Profile Image")
    .media-content
      .content
        p
          strong {{ who }}
          |  が
          strong 「{{ postTitle }}」
          |  を 
          strong 編集
          |  しました。
      nav.level.is-mobile
        .level-left
          | {{ when }}
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
    postTitle: {
      type: String,
      required: true
    },
    when: {
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