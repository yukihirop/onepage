import Vue from 'vue'
import Router from 'vue-router'
import homeRoutes from './home/index.js'

Vue.use(Router)

var router = new Router({
  linkActiveClass: 'is-active',
  linkExactActiveClass: 'is-active'
})

router.addRoutes(homeRoutes)

export default router
