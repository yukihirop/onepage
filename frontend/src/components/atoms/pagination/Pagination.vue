<template lang="pug">
nav.pagination.is-centered(role='navigation' arial-label='pagination')
  paginate(
    :page-count="pageCount"
    :margin-pages="0"
    :page-range="5"
    :initial-page="0"
    :click-handler="clickHander"
    :container-class="'pagination-list'"
    :page-link-class="'pagination-link'"
    :prev-link-class="'pagination-previous'"
    :next-link-class="'pagination-next'"
    :active-class="'is-current'"
    :first-last-button="true"
  )
</template>

<script>
  export default {
    props:{
      pageCount:{
        type: Number,
        required: true
      },
      clickHander:{
        type: Function,
        required: true
      }
    }
  }
</script>
