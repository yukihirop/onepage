import Vuex from 'vuex'
import { shallow, createLocalVue } from 'vue-test-utils'
import NavBar from '@/components/shopping/NavBar'
import store from '@/store'
import factoryCart from '@specs/factories/components/shopping/Cart'

const localVue = createLocalVue()

localVue.use(Vuex)

const $route = {
  path: '/test'
}

describe('NavBar.vue', () => {
  it('初期状態のレンダリングのテスト', () => {
    const wrapper = shallow(NavBar, { store, localVue, mocks: { $route } })
    const template = wrapper.html()
    expect(template).toMatchSnapshot()
  })

  it('storeを用意してのレンダリングのテスト', () => {
    const shoppingModule = {
      namespaced: true,
      getters: {
        cartProducts: jest.fn().mockReturnValue(factoryCart.cartProducts)
      }
    }
    const mockedStore = {
      modules: {
        shoppingModule,
      },
      mocks: {
        $route
      }
    }
    const store = new Vuex.Store(mockedStore)
    const wrapper = shallow(NavBar, { store, localVue })
    const template = wrapper.html()
    expect(template).toMatchSnapshot()
  })
})
