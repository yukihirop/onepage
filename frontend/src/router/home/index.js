import Home from '../../components/pages/Home.vue'
import TrendTable from '../../components/organisms/table/TrendTable.vue'
import TrendSideBar from '../../components/organisms/sidebar/TrendSideBar.vue'
import TimeLineTable from '../../components/organisms/table/TimeLineTable.vue'
import TimeLineSideBar from '../../components/organisms/sidebar/TimeLineSideBar.vue'
import TagFeedTable from '../../components/organisms/table/TagFeedTable.vue'
import TagFeedSideBar from '../../components/organisms/sidebar/TagFeedSideBar.vue'

const routes = [{
  path: '/',
  component: Home,
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

export default routes
