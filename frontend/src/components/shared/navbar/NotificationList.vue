<template lang="pug">
#dropdown-menu3.dropdown-menu(role='menu')
  .notification-list
    .notification-list-header
      .panel-block
        .panel-icon
          i.fa.fa-bell.fa-2x.trend
        .title.is-6 お知らせ
    .notification-list-content
      chat-tr(:profile-image-src='require("../../../assets/home/user/aimerald.png")',
               who="aimerald",    postTitle="OnePageというWEB...",    when="2019/12/31 17:50")
      chat-tr(:profile-image-src='require("../../../assets/home/user/YumaInaura.png")',
               who="Yuma Inaura", postTitle="rubyでLispの処理系を...", when="2019/12/25 18:00")
      edit-tr(:profile-image-src='require("../../../assets/home/user/aimerald.png")',
               who="aimerald",    postTitle="rubyでLispの処理系を...", when="2019/12/03 11:40")
      chat-tr(:profile-image-src='require("../../../assets/home/user/skuroki.jpg")',
               who="skuroki",     postTitle="瞑想がプログラマに与え...", when="2019/11/24 09:50")
      edit-tr(:profile-image-src='require("../../../assets/home/user/yuemori.png")',
               who="yuemori",     postTitle="Rails on Dockerとの戦い", when="2019/11/15 13:54")
    .notification-list-footer
      .panel-block
        a 通知一覧へ
</template>

<script>
import listener from '../mixins/dropdown.js'
import ChatTr from './partial/notificationlist/ChatTr.vue'
import EditTr from './partial/notificationlist/EditTr.vue'

export default {
  mixins: [listener],
  components: {
    ChatTr,
    EditTr
  },
  created: function() {
    // - ドロップメニューの外側をクリックしても閉じるようになる
    this.listen(window, 'click', function(e){
      if(!this.$el.contains(e.target)){
        this.$emit('close');
      }
    }.bind(this));
  }
}
</script>

<style scoped lang="stylus">
$theme_color = #0081C1

.dropdown-menu
  width: 320px
  // https://github.com/jgthms/bulma/issues/172
  left: -800%
.notification-list
  background-color: white
.notification-list-content
  height: auto
  max-height: 400px
  overflow-x: hidden
  overflow-y: scroll
.notification-list-footer
  .panel-block
    width: 100%
    padding-left: 120px
    a
      color: $theme_color
</style>