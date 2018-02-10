/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import SharedFooter from '@/components/atoms/footer/SharedFooter.vue'

require('@/assets/css/mybulma.scss')

storiesOf('atoms/Footer', module)
  .add('SharedFooter', () => ({
    components: { SharedFooter },
    template: `<shared-footer />`
  }))
