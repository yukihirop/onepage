<template lang="pug">
tr(style="padding-bottom: 0px;")
  td
    p(style="margin-top: 10px;") {{ rank }}
  td(style="width: 64px;")
    img(:src='profileImageSrc', style="width: 32px;margin-top: 10px;")
  td
    p
      | {{ username }}
      br
      small
        a @{{ mentionname }}
  td
    span.panel-icon
      i.fa.fa-thumbs-o-up(style="margin-top: 10px;")
        br
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