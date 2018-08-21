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
               :likes="user.post_likings_count")
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
        require("@/assets/home/user/gorilla.png"),
        require("@/assets/home/user/neko_8.png"),
        require("@/assets/home/user/neko_8.png"),
        require("@/assets/home/user/neko_8.png"),
        require("@/assets/home/user/neko_8.png"),
        require("@/assets/home/user/neko_8.png"),
        require("@/assets/home/user/neko_8.png"),
        require("@/assets/home/user/neko_8.png"),
        require("@/assets/home/user/neko_8.png"),
        require("@/assets/home/user/yukihirop.jpg")
          ],
      users: []
    }
  },
  // NOTE: mounted: () => {} では上手くいかない...
  // このコンポーネントが呼ばれる時に同期的に呼ばれるのだが、
  // このフックメソッドの中で非同期処理を読んでも同期的には動かない
  // なのでfetchUsersを非同期に実行したまま画面をレンダリングしてしまう
  // これを回避する策は現在(2018/03/03)無い。
  // 参考
  // https://stackoverflow.com/questions/40243417/how-to-make-an-async-call-in-a-beforecreate-hook-of-a-vue-instance
  // 上のリンクにも書いてあるようにskeletonで対応する
  // skeletonの実装の仕方はココを参考にする
  // https://kuroeveryday.blogspot.jp/2017/05/load-with-skeleton-screens-and-shimmer-effect.html
  mounted () {
    this.fetchUsers()
  },
  methods: {
    fetchUsers () {
      user.index().then(response => {
        response.data.forEach((user, index) => {
          var result = { name: user.profile.name, mention_name: user.mention_name, post_likings_count: user.post_likings_count }
          this.users.push(result)
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