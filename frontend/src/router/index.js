import Vue from 'vue'
import Router from 'vue-router'
import Products from '../components/shopping/Products.vue'

Vue.use(Router)

export default new Router({
  routes: [
  {
    path: '/',
    component: Products
  }
  ]
})