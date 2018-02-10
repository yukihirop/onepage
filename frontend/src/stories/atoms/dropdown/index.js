/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import AllInfoDropdown  from '@/components/atoms/dropdown/AllInfoDropdown.vue'
import HomeMenuDropdown from '@/components/atoms/dropdown/HomeMenuDropdown.vue'
import UserMenuDropdown from '@/components/atoms/dropdown/UserMenuDropdown.vue'

require('@/assets/css/mybulma.scss')

storiesOf('atoms/Dropdown', module)
  .add('AllInfoDropdown', () => ({
    components: { AllInfoDropdown },
    template: `<all-info-dropdown />`
  }))
  .add('HomeMenuDropdown', () => ({
    components: { HomeMenuDropdown },
    template: `<home-menu-dropdown />`
  }))
  .add('UserMenuDropdown', () => ({
    components: { UserMenuDropdown },
    template: `<user-menu-dropdown />`
  }))
