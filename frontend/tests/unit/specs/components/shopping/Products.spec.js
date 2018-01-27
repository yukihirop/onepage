import Vuex from 'vuex'
import { shallow, createLocalVue } from 'vue-test-utils'
import Products from '@/components/shopping/Products.vue'
import store from '@/store'
import factoryProducts from '@specs/factories/components/shopping/Products'

const localVue = createLocalVue()

localVue.use(Vuex)

describe('Products.vue', () => {
  it('初期状態のレンダリングのテスト', () => {
    const wrapper = shallow(Products, { store, localVue })
    const template = wrapper.html()
    expect(template).toMatchSnapshot()
  })

  it('storeを用意してレンダリングのテスト', () => {
    const mockedStore = {
      modules: {
        shoppingModule: {
          namespaced: true,
          getters: {
            allProducts: jest.fn().mockReturnValue(factoryProducts.allProducts),
            getNumberOfProducts: jest.fn().mockReturnValue(3)
          },
          methods: jest.fn()
        }
      }
    }
    const store = new Vuex.Store(mockedStore)
    const wrapper = shallow(Products, { store, localVue })
    const template = wrapper.html()
    expect(template).toMatchSnapshot()
  })
})
