import Vuex from 'vuex'
import { shallow, createLocalVue } from 'vue-test-utils'
import Cart from '@/components/shopping/Cart.vue'
import store from '@/store'
import factoryCart from '@specs/factories/components/shopping/Cart'

const localVue = createLocalVue()

localVue.use(Vuex)

describe('Cart.vue', () => {
  it('初期状態のレンダリングのテスト', () => {
    const wrapper = shallow(Cart, { store, localVue })
    const template = wrapper.html()
    expect(template).toMatchSnapshot()
  })

  it('storeを用意してのレンダリングのテスト', () => {
    const mockedStore = {
    modules: {
      shoppingModule: {
        namespaced: true,
        getters: {
            cartProducts: jest.fn().mockReturnValue(factoryCart.cartProducts),
          },
          methods: {
           checkout (state) {
             jest.fn()
           }
        },
      }
    }
  }
    const store = new Vuex.Store(mockedStore)
    const wrapper = shallow(Cart, { store })
    const template = wrapper.html()
    expect(template).toMatchSnapshot()
  })
})
