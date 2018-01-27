import Vuex from 'vuex'
import { shallow, createLocalVue } from 'vue-test-utils'
import Cart from '@/components/shopping/Cart.vue'
import store from '@/store'

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
            cartProducts: jest.fn().mockReturnValue([
              {
                name: 'a',
                price: 1,
                quantity: 10
              },
              {
                name: 'b',
                price: 2,
                quantity: 20
              },
              {
                name: 'c',
                price: 3,
                quantity: 30
              },
            ]),
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