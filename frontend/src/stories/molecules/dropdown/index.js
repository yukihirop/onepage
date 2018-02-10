/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import NotificationDropdown from '@/components/molecules/dropdown/NotificationDropdown.vue'

storiesOf('molecules/Dropdown', module)
  .add('NotificationDropdown', () => ({
    components: { NotificationDropdown },
    template: `<notification-dropdown />`
  }))
