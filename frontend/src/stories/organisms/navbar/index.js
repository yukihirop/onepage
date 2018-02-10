/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import SharedNavBar  from '@/components/organisms/navbar/SharedNavBar.vue'

require('@/assets/css/mybulma.scss')

storiesOf('organisms/NavBar', module)
  .add('SharedNavBar', () => ({
    components: { SharedNavBar },
    template: `<shared-nav-bar />`
  }))
