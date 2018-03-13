import Vuex from 'vuex'
import { shallow, createLocalVue } from 'vue-test-utils'
import UserMedia from '@/components/organisms/media_object/UserMedia.vue'
import factoryUsers from '@/components/__test__/factories/users'

const localVue = createLocalVue()

localVue.use(Vuex)

describe('UserMedia.vue', () => {
  it('レンダリングのテスト', () => {
    // shallowは子コンポーネントまで入り込まない。
    // <!---->のように置き換えてしまう
    // そのため？子との共有プロパティーである?
    // profileImageSrcに値が渡らない
    // profileImageSrcはrequiredなので実行時にエラーがでるので
    // falseにして上書きしている
    // 下記エラーの回避策
    // console.error node_modules/vue/dist/vue.runtime.common.js:576
    // [Vue warn]: Missing required prop: "profileImageSrc"
    const wrapper = shallow(UserMedia, {
      localVue,
      props: {
        profileImageSrc: {
          type: String,
          required: false
        }
      }
    })
    wrapper.setData(factoryUsers.data())

    const template = wrapper.html()
    expect(template).toMatchSnapshot()
  })
})
