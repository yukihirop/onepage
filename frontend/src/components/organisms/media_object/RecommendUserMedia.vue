<template lang="pug">
nav.panel
  .panel-heading
    .title.is-6 おすすめのユーザー
  recommend-user-media(:profile-image-src='require("@/assets/home/user/yaotti.png")',        username='海野 弘成',       mentionname='yaotti', introduction='Qiita,Qiita:Team(Ruby on Rails)やKobito(Objective-C)の開発をしています.')
  recommend-user-media(:profile-image-src='require("@/assets/home/user/neko_4.png")',     username='Takanori Yokoi', mentionname='neko_4', introduction='Co-Founder.COO at Qiita (Increments.inc)')
  recommend-user-media(:profile-image-src='require("@/assets/home/user/yukihiro_matz.png")', username='まつもと ゆきひろ', mentionname='yukihiro_matz',introduction='Rubyのパパ')
  recommend-user-media(:profile-image-src='require("@/assets/home/user/yusabana.png")',      username='Yuji Takaesu',   mentionname='yusabana',  introduction='')
  recommend-user-media(:profile-image-src='require("@/assets/home/user/neko_2.png")',    username='neko_2',     mentionname='neko_2',  introduction='')
  recommend-user-media(:profile-image-src='require("@/assets/home/user/usagi.png")',      username='Shunichi Ikegami', mentionname='usagi',  introduction='')
  recommend-user-media(:profile-image-src='require("@/assets/home/user/neko_3.png")',    username='TatsuyaOgi',     mentionname='neko_3',  introduction='お気に入りは、Ruby、Ruby on Rails')
</template>

<script>
import RecommendUserMedia from '@/components/atoms/media_object/RecommendUserMedia.vue'

export default {
  components: {
    RecommendUserMedia
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