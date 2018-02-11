/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import VueInfoAddon  from 'storybook-addon-vue-info'

import NotificationDropdown from '@/components/molecules/dropdown/NotificationDropdown.vue'

storiesOf('molecules/Dropdown', module)
  .addDecorator(VueInfoAddon)
  .add('NotificationDropdown', () => ({
    components: { NotificationDropdown },
    template: `<notification-dropdown />`
  }))
