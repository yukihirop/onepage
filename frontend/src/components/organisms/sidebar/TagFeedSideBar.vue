<template lang="pug">
.tile.is-ancestor
  .tile.is-vertical
    .tile
      .tile.is-parent.is-vertical
        article.tile.is-child
          advertisement-figure
        article.tile.is-child
          tag-media
</template>

<script>
import AdvertisementFigure from '@/components/atoms/figure/AdvertisementFigure.vue'
import TagMedia from '@/components/organisms/media_object/TagMedia.vue'

export default {
  components: {
    AdvertisementFigure,
    TagMedia
  }
}
</script>