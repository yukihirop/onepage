/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import VueInfoAddon  from 'storybook-addon-vue-info'

import AdvertisementFigure  from '@/components/atoms/figure/AdvertisementFigure.vue'

require('@/assets/css/mybulma.scss')

storiesOf('atoms/Figure', module)
  .addDecorator(VueInfoAddon)
  .add('AdvertisementFigure', () => ({
    components: { AdvertisementFigure },
    template: `<advertisement-figure />`
  }))
