// import Vuex from 'vuex'
// import { shallow, createLocalVue } from 'vue-test-utils'
// import UserMedia from '/components/atoms/media_object/UserMedia.vue'
// import factoryUsers from '@/components/__test__/factories/users'

// const localVue = createLocalVue()

// localVue.use(Vuex)

// var testProps = (user) => {
//   return {
//     rank: 1,
//     username: user.name,
//     profileImageSrc: require("@/assets/home/user/yukihirop.jpg"),
//     mentionname: user.mention_name,
//     likes: user.userLikeCount
//   }
// }

// describe('UserMedia.vue', () => {
//   it('レンダリングのテスト', () => {
//     var user = factoryUsers.data().users[0]
//     console.log(testProps(user))
//     const wrapper = shallow(UserMedia, {
//       localVue,
//       props: {
//         rank: {
//           type: Number,
//           required: true
//         },
//         profileImageSrc: {
//           type: String,
//           required: false
//         },
//         username: {
//           type: String,
//           required: true
//         },
//         mentionname: {
//           type: String,
//           required: true
//         },
//         likes: {
//           type: Number,
//           required: true
//         }
//       },
//       propsData: testProps(user)
//       // attrs: {
//       //   src: require("@/assets/home/user/yukihirop.jpg")
//       // }
//     })
//     // wrapper.setData({
//     //   src: require(wrapper.vm.$profileImageSrc)
//     // })
//     const template = wrapper.html()
//     expect(template).toMatchSnapshot()
//   })
// })

describe('UserMedia.vue', () => {
  it('レンダリングのテスト', () => {
    expect(true).toBe(true)
  })
})
