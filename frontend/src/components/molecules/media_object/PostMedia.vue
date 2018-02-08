<template lang="pug">
.panel-block
  .m-post-media-left
    .m-post-media-left-image
      figure.image.is-64x64
        img(:src='profileImageSrc', alt='Placeholder image')
    .m-post-media-left-detail
      ul(style='text-align: left;')
        li
          b {{ who }}
        li
          b {{ when }}
        br
        li.thumbs-o-up(style='margin-left: 25px;')
         span.icon.is-small
            i.fa.fa-thumbs-o-up
              b {{ likes }}
  .m-post-media-right
    .m-post-media-right-title
      h1
        b {{ title }}
    .m-post-media-right-organization(v-show='organization')
      span.icon.is-small
        i.fa.fa-briefcase.org
      small {{ organization }}
    .m-post-media-right-summary
      p
        | {{ summary }}
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
    likes: {
      type: Number,
      required: true
    },
    title: {
      type: String,
      required: true
    },
    organization: {
      type: String,
      required: false
    },
    summary: {
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

<style scoped lang="stylus">
$custome_white = #F8F8F8
$custome_gray  = #CCCCCC
$organization_color = #8E8E8E
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

.m-post-media-left
  background-color: $custome_white
  color: $theme_color

  &-image
    figure
      padding-top: 10px
      padding-left: 10px

  &-detail
    width: 150px
    padding-top: 10px
    // mybulma.scss では以下が必要
    ul
      li
        margin-left: 10px

.m-post-media-right
  display: inline-flex
  flex-direction: column
  text-align: left
  background-color: white
  padding-left: 0.5em
  width: 100%

  &-title
    padding: 0.5em
    padding-bottom: 0em
    h1
      padding: 0.25em 0.5em
      border-left: $custome_gray solid 10px

  &-organization
    padding-left: 1.5em
    .org
      color: $organization_color
    small
      padding-left: 0.5em
      color: $organization_color

  &-summary
    padding-top: 0.25em
    padding-bottom: 1.0em
    padding-left: 1.5em
    padding-right: 1.5em
</style>