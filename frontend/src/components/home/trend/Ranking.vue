<template lang="pug">
.tile.is-ancestor
  .tile.is-vertical
    .tile
      .tile.is-parent.is-vertical
        article.tile.is-child
          advertisement
        article.tile.is-child
          user-lanking
        article.tile.is-child
          tag-lanking
</template>

<script>
import Advertisement from '../Advertisement.vue'
import UserLanking from '../partial/ranking/User.vue'
import TagLanking from '../partial/ranking/Tag.vue'

export default {
  components: {
    Advertisement,
    UserLanking,
    TagLanking
  }
}
</script>