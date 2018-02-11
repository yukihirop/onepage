/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import StoryRouter from 'storybook-router'

import Home            from '@/components/pages/Home.vue'
import TrendTable      from '@/components/organisms/table/TrendTable.vue'
import TrendSideBar    from '@/components/organisms/sidebar/TrendSideBar.vue'
import TimeLineTable   from '@/components/organisms/table/TimeLineTable.vue'
import TimeLineSideBar from '@/components/organisms/sidebar/TimeLineSideBar.vue'
import TagFeedTable    from '@/components/organisms/table/TagFeedTable.vue'
import TagFeedSideBar  from '@/components/organisms/sidebar/TagFeedSideBar.vue'

require('@/assets/css/mybulma.scss')

const homeRoutes = [{
  path: '/',
  component: Home,
  linkActiveClass: 'is-active',
  linkExactActiveClass: 'is-active',
  children: [
    {
      path: '',
      redirect: 'trend'
    },
    {
      path: 'trend',
      components: {
        'table': TrendTable,
        'sidebar': TrendSideBar
      }
    },
    {
      path: 'timeline',
      components: {
        'table': TimeLineTable,
        'sidebar': TimeLineSideBar
      }
    },
    {
      path: 'tagfeed',
      components: {
        'table': TagFeedTable,
        'sidebar': TagFeedSideBar
      }
    }]
}]

storiesOf('pages', module)
  .addDecorator(StoryRouter({},
    {
      routes: homeRoutes,
      initialEntry: '/trend'
    }
  )
  )
  .add('Home', () => ({
    // <home />では何も表示されない(原因不明)
    template: `<router-view />`
  }))
