<template lang="pug">
.tile.is-ancestor
  .tile.is-vertical
    .tile
      .tile.is-parent.is-vertical
        article.tile.is-child
          advertisement-figure
        article.tile.is-child
          recommend-user-media
</template>

<script>
import AdvertisementFigure from '../../atoms/figure/AdvertisementFigure.vue'
import RecommendUserMedia from '../media_object/RecommendUserMedia.vue'

export default {
  components: {
    AdvertisementFigure,
    RecommendUserMedia
  }
}
</script>