import Vue from 'vue'
import App from './App.vue'
import store from './store/index.js'
import router from './router'
import Paginate from 'vuejs-paginate'

Vue.component('paginate', Paginate)

/* eslint no-new: 0 */
new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
