import Vuex from 'vuex'
import { shallow, createLocalVue } from 'vue-test-utils'
import NavBar from '@/components/shopping/NavBar'
import store from '@/store'

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
    const mockedStore = {
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
      },
    }
    const store = new Vuex.Store(mockedStore)
    // 今現在、itemsInCartは名前空間で別れていないので、namespaced: trueなmockedStoreではmockできない
    // TODO: 今後いい方法を考える
    const wrapper = shallow(NavBar, { store, localVue, mocks: { $route }, computed: { itemsInCart: jest.fn().mockReturnValue(10)}})
    const template = wrapper.html()
    expect(template).toMatchSnapshot()
  })
})
