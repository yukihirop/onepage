import Vuex from 'vuex'
import { shallow, createLocalVue } from 'vue-test-utils'
import TagMedia from '@/components/organisms/media_object/TagMedia.vue'
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
      }
    })
    wrapper.setData(factoryTags.data())

    const template = wrapper.html()
    expect(template).toMatchSnapshot()
  })

  it('defaultのdata()のテスト', () => {
    expect(typeof TagMedia.data).toBe('function')
    const defaultData = TagMedia.data()
    // assetsTransformerによって画像名に変換されてしまう。
    expect(defaultData.tagImageSrcs).toEqual(["Python.jpg", "JavaScript.jpg", "Ruby.jpg", "AWS.jpg", "Android.jpg", "Docker.png", "Swift.png", "iOS.png", "Rails.jpg", "PHP.jpg"])
    expect(defaultData.tags).toEqual([])
  })

  it('子コンポーネント以外のテキストが正しく表示されること', () => {
    const wrapper = shallow(TagMedia)
    expect(wrapper.text()).toEqual(expect.stringMatching(/タグ・ランキング/))
    expect(wrapper.text()).toEqual(expect.stringMatching(/週間/))
    expect(wrapper.text()).toEqual(expect.stringMatching(/月間/))
    expect(wrapper.text()).toEqual(expect.stringMatching(/全て/))
  })
})
