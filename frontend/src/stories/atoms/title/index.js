/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import VueInfoAddon  from 'storybook-addon-vue-info'

import TagFeedTableTitle  from '@/components/atoms/title/TagFeedTableTitle.vue'
import TimeLineTableTitle from '@/components/atoms/title/TimeLineTableTitle.vue'
import TrendTableTitle    from '@/components/atoms/title/TrendTableTitle.vue'

require('@/assets/css/mybulma.scss')

storiesOf('atoms/Title', module)
  .addDecorator(VueInfoAddon)
  .add('TagFeedTableTitle', () => ({
    components: { TagFeedTableTitle },
    template: `<tag-feed-table-title />`
  }))
  .add('TimeLineTableTitle', () => ({
    components: { TimeLineTableTitle },
    template: `<time-line-table-title />`
  }))
  .add('TrendTableTitle', () => ({
    components: { TrendTableTitle },
    template: `<trend-table-title />`
  }))