<template lang="pug">
.panel-block
  .post-left
    .post-image
      figure.image.is-64x64
        img(src='https://bulma.io/images/placeholders/64x64.png', alt='Placeholder image')
    .post-detail
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
  .post-right
    .post-title
      h1
        b {{ title }}
    .post-organization(v-show='organization')
      span.icon.is-small
        i.fa.fa-briefcase.org
      small {{ organization }}
    .post-summary
      p
        | {{ summary }}
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

.post-left
  background-color: $custome_white
  color: $theme_color

.post-image
  figure
    padding-top: 10px
    padding-left: 10px

.post-detail
  width: 150px
  padding-top: 10px

.post-right
  display: inline-flex
  flex-direction: column
  text-align: left
  background-color: white
  padding-left: 0.5em
  width: 100%

.post-title
  padding: 0.5em
  padding-bottom: 0em
  h1
    padding: 0.25em 0.5em
    border-left: $custome_gray solid 10px

.post-organization
  padding-left: 1.5em
  .org
    color: $organization_color

  small
    padding-left: 0.5em
    color: $organization_color

.post-summary
  padding-top: 0.25em
  padding-bottom: 1.0em
  padding-left: 1.5em
  padding-right: 1.5em
</style>