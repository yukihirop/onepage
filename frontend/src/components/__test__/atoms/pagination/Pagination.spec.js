import Vuex from 'vuex'
import { mount, createLocalVue } from 'vue-test-utils'
import Paginaiton from '@/components/atoms/pagination/Pagination.vue'

const localVue = createLocalVue()
localVue.use(Vuex)

describe('Pagination.vue', () => {
  it('propsのテスト', () => {
    var myMock = jest.fn()
    const wrapper = mount(Paginaiton,{ localVue,
      propsData: {
        pageCount: 5,
        clickHander: myMock
      }
    })
    expect(wrapper.props().pageCount).toBe(5)
    expect(wrapper.props().clickHander).toEqual(myMock)
  })
})
