import Vue from 'vue'
import Vuex from 'vuex'
import shoppingModule from './modules/shopping'

Vue.use(Vuex)

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  strict: debug,
  modules: {
    shoppingModule
  }
})
