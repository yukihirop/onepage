import Home              from '../../components/home/App.vue'
import TrendMainTable    from '../../components/home/trend/MainTable.vue'
import TrendRanking      from '../../components/home/trend/Ranking.vue'
import TimeLineMainTable from '../../components/home/timeline/MainTable.vue'
import TimeLineUserList  from '../../components/home/timeline/UserList.vue'
import TagFeedMainTable  from '../../components/home/tagfeed/MainTable.vue'
import TagFeedRanking    from '../../components/home/tagfeed/Ranking.vue'

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
    'main-table': TrendMainTable,
    'ranking': TrendRanking
    }
  },
  {
    path: 'timeline',
    components: {
    'main-table': TimeLineMainTable,
    'ranking': TimeLineUserList
    }
  },
  {
    path: 'tagfeed',
    components: {
    'main-table': TagFeedMainTable,
    'ranking': TagFeedRanking
    }
  }]
}]

export default routes