<template lang="pug">
.tile.is-ancestor
  .tile.is-vertical
    .tile
      .tile.is-parent.is-vertical
        article.tile.is-child
          advertisement
        article.tile.is-child
          tag-lanking
</template>

<script>
import Advertisement from '../Advertisement.vue'
import TagLanking from '../partial/ranking/Tag.vue'

export default {
  components: {
    Advertisement,
    TagLanking
  }
}
</script>