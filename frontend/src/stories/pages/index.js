/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import Home  from '@/components/pages/Home.vue'

require('@/assets/css/mybulma.scss')

storiesOf('pages', module)
  .add('Home', () => ({
    components: { Home },
    template: `<home />`
  }))
