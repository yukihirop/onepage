<template lang="pug">
nav.panel
  .panel-heading
    .title.is-6 ユーザー・ランキング
  .panel-tabs
    a.is-active 週間
    a 月間
    a 全て
  .panel-block(v-for='(user, index) in users')
    user-media(:rank="index+1",
               :profile-image-src='profileImageSrcs[index]',
               :username="user.name",
               :mentionname="user.mention_name",
               :likes="user.userLikeCount")
</template>

<script>
import UserMedia from '@/components/atoms/media_object/UserMedia.vue'
import { user } from '@/api/index'
import { userLike } from '@/api/index'

export default {
  components: {
    UserMedia
  },
  props: {
    profileImageSrc: {
      type: String,
      required: true
    }
  },
  data () {
    return {
      // TODO: このやり方は一時しのぎであって実際はDBから取得するようにしたい
      profileImageSrcs: [
        require("@/assets/home/user/aimerald.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/yukihirop.jpg")
          ],
      users: []
    }
  },
  // mounted: () => {} では上手くいかない...
  mounted () {
    this.fetchUsers()
  },
  methods: {
    fetchUserLike (user, index, params) {
      userLike.index(params).then(response => {
        var userLikeCount = response.data.length
        var result = Object.assign(user, { userLikeCount: userLikeCount })
        this.users.push(result)
      }).catch(error => {
        console.error(error)
      })
    },
    fetchUsers () {
      user.index().then(response => {
        response.data.forEach((user, index) => {
          var params = { mention_name: user.mention_name }
          this.fetchUserLike(user, index, params)
        })
      }).catch(error => {
        console.error(error)
      })
    }
  }
}
</script>

<style scoped lang="stylus">
$custome_white = #F8F8F8
$theme_color = #0081C1

nav.panel
  a
    color: $theme_color
    .is-active
      color: dark

.panel-heading
  margin-bottom: 0px
  background-color: $theme_color
  
  .title
    color: white
  
.panel-tabs
  padding-bottom: 0px
  margin-bottom: 0px
  background-color: $custome_white

.panel-block
  background-color: white
  padding-top: 0
  padding-bottom: 0
  margin-top: 0
  margin-bottom: 0
</style>