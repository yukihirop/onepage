/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import AdvertisementFigure  from '@/components/atoms/figure/AdvertisementFigure.vue'

require('@/assets/css/mybulma.scss')

storiesOf('atoms/Figure', module)
  .add('AdvertisementFigure', () => ({
    components: { AdvertisementFigure },
    template: `<advertisement-figure />`
  }))
