<template lang="pug">
.tile.is-ancestor
  .tile.is-vertical
    .tile
      .tile.is-parent.is-vertical
        article.tile.is-child
          advertisement
        article.tile.is-child
          user-ranking
</template>

<script>
import Advertisement from '../Advertisement.vue'
import UserRanking from '../partial/ranking/User.vue'

export default {
  components: {
    Advertisement,
    UserRanking
  }
}
</script>