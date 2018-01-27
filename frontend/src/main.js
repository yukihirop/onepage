import Vue from 'vue'
import App from './App.vue'
import store from './store/index.js'
import router from './router'
import BootstrapVue from 'bootstrap-vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)

/* eslint no-new: 0 */
new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
