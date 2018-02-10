/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import HomeMenu      from '@/components/molecules/menu/HomeMenu.vue'

require('@/assets/css/mybulma.scss')

storiesOf('molecules/Menu', module)
  .add('HomeMenu', () => ({
    components: { HomeMenu },
    template: `<home-menu />`
  }))
