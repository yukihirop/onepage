<template lang="pug">
.m-notification-dropdown
  .m-notification-dropdown-header
    .panel-block
      .panel-icon
        i.fa.fa-bell.fa-2x.trend
      .title.is-6 お知らせ
  .m-notification-dropdown-content
    notification-chat-media(:profile-image-src='require("@/assets/home/user/gorilla.png")',
             who="gorilla",    postTitle="OnePageというWEB...",    when="2019/12/31 17:50")
    notification-chat-media(:profile-image-src='require("@/assets/home/user/neko_8.png")',
             who="neko_8", postTitle="rubyでLispの処理系を...", when="2019/12/25 18:00")
    notification-edit-media(:profile-image-src='require("@/assets/home/user/gorilla.png")',
             who="gorilla",    postTitle="rubyでLispの処理系を...", when="2019/12/03 11:40")
    notification-chat-media(:profile-image-src='require("@/assets/home/user/panda.jpg")',
             who="panda",     postTitle="瞑想がプログラマに与え...", when="2019/11/24 09:50")
    notification-edit-media(:profile-image-src='require("@/assets/home/user/neko_6.png")',
             who="neko_6",     postTitle="Rails on Dockerとの戦い", when="2019/11/15 13:54")
  .m-notification-dropdown-footer
    .panel-block
      a 通知一覧へ
</template>

<script>
import listener from '@/components/mixins/dropdown.js'
import NotificationChatMedia from '@/components/atoms/media_object/NotificationChatMedia.vue'
import NotificationEditMedia from '@/components/atoms/media_object/NotificationEditMedia.vue'

export default {
  mixins: [listener],
  components: {
    NotificationChatMedia,
    NotificationEditMedia
  },
  created: function () {
    // - ドロップメニューの外側をクリックしても閉じるようになる
    this.listen(window, 'click', function (e) {
      if (!this.$el.contains(e.target)) {
        this.$emit('close')
      }
    }.bind(this))
  }
}
</script>

<style scoped lang="stylus">
$theme_color = #0081C1

.m-notification-dropdown
  width: 320px
  background-color: white
  &-content
    height: auto
    max-height: 400px
    overflow-x: hidden
    overflow-y: scroll
  &-footer
    .panel-block
      width: 100%
      padding-left: 120px
      a
        color: $theme_color
</style>