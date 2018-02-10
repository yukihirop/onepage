<template lang="pug">
.tile.is-ancestor
  .tile.is-vertical
    .tile
      .tile.is-parent.is-vertical
        article.tile.is-child
          advertisement-figure
        article.tile.is-child
          user-media
        article.tile.is-child
          tag-media
</template>

<script>
import AdvertisementFigure from '../../atoms/figure/AdvertisementFigure.vue'
import UserMedia from '../../organisms/media_object/userMedia.vue'
import TagMedia from '../../organisms/media_object/TagMedia.vue'

export default {
  components: {
    AdvertisementFigure,
    UserMedia,
    TagMedia
  }
}
</script>