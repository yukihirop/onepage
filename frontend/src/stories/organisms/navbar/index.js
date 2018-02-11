/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import VueInfoAddon  from 'storybook-addon-vue-info'

import SharedNavBar  from '@/components/organisms/navbar/SharedNavBar.vue'

require('@/assets/css/mybulma.scss')

storiesOf('organisms/NavBar', module)
  .addDecorator(VueInfoAddon)
  .add('SharedNavBar', () => ({
    components: { SharedNavBar },
    template: `<shared-nav-bar />`
  }))
