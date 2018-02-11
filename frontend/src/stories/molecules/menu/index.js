/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import StoryRouter from 'storybook-router'
import VueInfoAddon  from 'storybook-addon-vue-info'

import HomeMenu        from '@/components/molecules/menu/HomeMenu.vue'
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

require('@/assets/css/mybulma.scss')

storiesOf('molecules/Menu', module)
  .addDecorator(VueInfoAddon)
  .addDecorator(StoryRouter({},
      {
        routes: homeRoutes,
        initialEntry: '/trend'
      }
    )
  )
  .add('HomeMenu', () => ({
    components: { HomeMenu },
    template: `<home-menu />
               <router-view />
              `
  }))
