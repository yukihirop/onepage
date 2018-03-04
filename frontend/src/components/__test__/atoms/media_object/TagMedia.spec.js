import Vuex from 'vuex'
import { shallow, createLocalVue } from 'vue-test-utils'
import TagMedia from '/components/atoms/media_object/TagMedia.vue'
import factoryTags from '@/components/__test__/factories/tags'

const localVue = createLocalVue()

localVue.use(Vuex)

var testProps = (tag) => {
  return {
    rank: 1,
    tagname: tag.name,
    tagImageSrc: require("@/assets/home/tag/Python.jpg"),
    posts: tag.post_count
  }
}

describe('TagMedia.vue', () => {
  it('レンダリングのテスト', () => {
    var tag = factoryTags.data().tags[0]
    const wrapper = shallow(TagMedia, {
      localVue,
      props: {
        rank: {
          type: Number,
          required: true
        },
        tagImageSrc: {
          type: String,
          required: false
        },
        tagname: {
          type: String,
          required: true
        },
        posts: {
          type: Number,
          required: true
        }
      },
      propsData: testProps(tag)
      // attrs: {
      //   src: require("@/assets/home/tag/Python.jpg")
      // }
    })
    // wrapper.setData({
    //   src: require(wrapper.vm.$tagImageSrc)
    // })
    const template = wrapper.html()
    expect(template).toMatchSnapshot()
  })
})
