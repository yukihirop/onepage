<template lang="pug">
.post-content
  .post-content-title
    h1
      b {{ title }}
  .post-content-organization(v-show='organization')
    span.icon.is-small
      i.fa.fa-briefcase.org
    small {{ organization }}
  .post-content-summary
    p
      | {{ summary }}
</template>

<script>
export default {
  props: {
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
$custome_gray  = #CCCCCC
$organization_color = #8E8E8E

.post-content
  display: inline-flex
  flex-direction: column
  text-align: left
  background-color: white
  padding-left: 0.5em

  .post-content-title
    padding: 0.5em
    padding-bottom: 0em
    h1
      padding: 0.25em 0.5em
      border-left: $custome_gray solid 10px

  .post-content-organization
    padding-left: 1.5em
    .org
      color: $organization_color

    small
      padding-left: 0.5em
      color: $organization_color

  .post-content-summary
    padding-top: 0.25em
    padding-bottom: 1.0em
    padding-left: 1.5em
    padding-right: 1.5em
</style>

