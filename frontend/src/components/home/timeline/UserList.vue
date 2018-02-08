<template lang="pug">
.tile.is-ancestor
  .tile.is-vertical
    .tile
      .tile.is-parent.is-vertical
        article.tile.is-child
          advertisement
        article.tile.is-child
          recommend-user-list
</template>

<script>
import Advertisement from '../Advertisement.vue'
import RecommendUserList from './partial/userlist/RecommendUser.vue'

export default {
  components: {
    Advertisement,
    RecommendUserList
  }
}
</script>