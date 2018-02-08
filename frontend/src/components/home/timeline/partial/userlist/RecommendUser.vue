<template lang="pug">
nav.panel
  .panel-heading
    .title.is-6 おすすめのユーザー
  recommend-user-tr(:profile-image-src='require("../../../../../assets/home/user/yaotti.png")',        username='海野 弘成',       mentionname='yaotti', introduction='Qiita,Qiita:Team(Ruby on Rails)やKobito(Objective-C)の開発をしています.')
  recommend-user-tr(:profile-image-src='require("../../../../../assets/home/user/tatata111.png")',     username='Takanori Yokoi', mentionname='tatata111', introduction='Co-Founder.COO at Qiita (Increments.inc)')
  recommend-user-tr(:profile-image-src='require("../../../../../assets/home/user/yukihiro_matz.png")', username='まつもと ゆきひろ', mentionname='yukihiro_matz',introduction='Rubyのパパ')
  recommend-user-tr(:profile-image-src='require("../../../../../assets/home/user/yusabana.png")',      username='Yuji Takaesu',   mentionname='yusabana',  introduction='')
  recommend-user-tr(:profile-image-src='require("../../../../../assets/home/user/spring_aki.png")',    username='spring_aki',     mentionname='spring_aki',  introduction='')
  recommend-user-tr(:profile-image-src='require("../../../../../assets/home/user/shunichi.png")',      username='Shunichi Ikegami', mentionname='shunichi',  introduction='')
  recommend-user-tr(:profile-image-src='require("../../../../../assets/home/user/t_oginogin.png")',    username='TatsuyaOgi',     mentionname='t_oginogin',  introduction='お気に入りは、Ruby、Ruby on Rails')
</template>

<script>
import RecommendUserTr from './RecommendUserTr.vue'

export default {
  components: {
    RecommendUserTr
  },
  props: {
    profileImageSrc: {
      type: String,
      required: true
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
</style>