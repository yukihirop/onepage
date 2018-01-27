import Vue from 'vue'
import Router from 'vue-router'
import Products from '../components/shopping/Products.vue'
import Cart from '../components/shopping/Cart.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      component: Products
    },
    {
      path: '/cart',
      component: Cart
    }
  ]
})
