/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import TagFeedSideBar  from '@/components/organisms/sidebar/TagFeedSideBar.vue'
import TimeLineSideBar from '@/components/organisms/sidebar/TimeLineSideBar.vue'
import TrendSideBar    from '@/components/organisms/sidebar/TrendSideBar.vue'

require('@/assets/css/mybulma.scss')

storiesOf('organisms/SideBar', module)
  .add('TagFeedSideBar', () => ({
    components: { TagFeedSideBar },
    template: `<tag-feed-side-bar />`
  }))
  .add('TimeLineSideBar', () => ({
    components: { TimeLineSideBar },
    template: `<time-line-side-bar />`
  }))
  .add('TrendSideBar', () => ({
    components: { TrendSideBar },
    template: `<trend-side-bar />`
  }))
