import Vuex from 'vuex'
import { shallow, createLocalVue } from 'vue-test-utils'
import TagMedia from '@/components/organisms/media_object/TagMedia.vue'
import ChildTagMedia from '/components/atoms/media_object/TagMedia.vue'
import factoryTags from '@/components/__test__/factories/tags'

const localVue = createLocalVue()

localVue.use(Vuex)

describe('TagMedia.vue', () => {
  it('レンダリングのテスト', () => {
    // shallowは子コンポーネントまで入り込まない。
    // <!---->のように置き換えてしまう
    // そのため？子との共有プロパティーである?
    // tagImageSrcに値が渡らない
    // tagImageSrcはrequiredなので実行時にエラーがでるので
    // falseにして上書きしている
    // 下記エラーの回避策
    // console.error node_modules/vue/dist/vue.runtime.common.js:576
    // [Vue warn]: Missing required prop: "tagImageSrc"
    const wrapper = shallow(TagMedia, {
      localVue,
      props: {
        tagImageSrc: {
          type: String,
          required: false
        }
      },
      // 効果無いような気がすうる
      stubs: {
        'child-tag-media': ChildTagMedia
      }
    })
    wrapper.setData(factoryTags.data())

    const template = wrapper.html()
    expect(template).toMatchSnapshot()
  })
})
