<template lang="pug">
tr(style="padding-bottom: 0px;")
  td
    p(style="margin-top: 10px;") {{ rank }}
  td(style="width: 64px;")
    img(v-bind:src='imageSrc', style="width: 32px;margin-top: 10px;")
  td
    b
      | {{ tagname }}
  td
    b {{ posts }}
    br
    small posts
</template>

<script>
export default {
  props: {
    rank: {
      type: Number,
      required: true
    },
    imageSrc: {
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
      src: this.imageSrc
    }
  }
}
</script>