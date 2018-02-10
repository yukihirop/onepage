/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import TagFeedTable   from '@/components/organisms/table/TagFeedTable.vue'
import TimeLineTable  from '@/components/organisms/table/TimeLineTable.vue'
import TrendTable     from '@/components/organisms/table/TrendTable.vue'

require('@/assets/css/mybulma.scss')

storiesOf('organisms/Table', module)
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
