/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import VueInfoAddon  from 'storybook-addon-vue-info'

import TagFeedTable   from '@/components/organisms/table/TagFeedTable.vue'
import TimeLineTable  from '@/components/organisms/table/TimeLineTable.vue'
import TrendTable     from '@/components/organisms/table/TrendTable.vue'

require('@/assets/css/mybulma.scss')

storiesOf('organisms/Table', module)
  .addDecorator(VueInfoAddon)
  .add('TagFeedTable', () => ({
    components: { TagFeedTable },
    template: `<tag-feed-table />`
  }))
  .add('TimeLineTable', () => ({
    components: { TimeLineTable },
    template: `<time-line-table />`
  }))
  .add('TrendTable', () => ({
    components: { TrendTable },
    template: `<trend-table />`
  }))
