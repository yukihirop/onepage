import Vuex from 'vuex'
import { shallow, createLocalVue } from 'vue-test-utils'
import Products from '@/components/shopping/Products.vue'
import store from '@/store'

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
            allProducts: jest.fn().mockReturnValue([
              {
                id: '1',
                name: 'a',
                description: 'A',
                price: 1
              },
              {
                id: '2',
                name: 'b',
                description: 'B',
                price: 2
              },
              {
                id: '3',
                name: 'c',
                description: 'C',
                price: 3
              },
              ]),
            getNumberOfProducts: jest.fn().mockReturnValue(3)
          },
          methods: jest.fn()
        }
      }
    }
    const store = new Vuex.Store(mockedStore)
    const wrapper = shallow(Products, { store, localVue})
    const template = wrapper.html()
    expect(template).toMatchSnapshot()
  })
})