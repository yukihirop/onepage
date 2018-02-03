<template lang="pug">
nav.panel
  .panel-heading
    .title.is-6 ユーザー・ランキング
  .panel-tabs
    a.is-active 週間
    a 月間
    a 全て
  user-tr(rank=1, :profile-image-src='require("../../../../assets/home/user/aimerald.png")', username='aimerald',    mentionname='aimerald', likes=999)
  user-tr(rank=2,  :profile-image-src='require("../../../../assets/home/user/YumaInaura.png")', username='Yuma Inaura', mentionname='yinaura', likes=9999)
  user-tr(rank=3,  :profile-image-src='require("../../../../assets/home/user/YumaInaura.png")', username='Yuma Inaura', mentionname='yinaura',  likes=8888)
  user-tr(rank=4,  :profile-image-src='require("../../../../assets/home/user/YumaInaura.png")', username='Yuma Inaura', mentionname='yinaura',  likes=7777)
  user-tr(rank=5,  :profile-image-src='require("../../../../assets/home/user/YumaInaura.png")', username='Yuma Inaura', mentionname='yinaura',  likes=6666)
  user-tr(rank=6,  :profile-image-src='require("../../../../assets/home/user/YumaInaura.png")', username='Yuma Inaura', mentionname='yinaura',  likes=5555)
  user-tr(rank=7,  :profile-image-src='require("../../../../assets/home/user/YumaInaura.png")', username='Yuma Inaura', mentionname='yinaura',  likes=4444)
  user-tr(rank=8,  :profile-image-src='require("../../../../assets/home/user/YumaInaura.png")', username='Yuma Inaura', mentionname='yinaura',  likes=333)
  user-tr(rank=9,  :profile-image-src='require("../../../../assets/home/user/YumaInaura.png")', username='Yuma Inaura', mentionname='yinaura',  likes=22)
  user-tr(rank=10, :profile-image-src='require("../../../../assets/home/user/yukihirop.jpg")', username='yukihirop',   mentionname='yukihirop',likes=1)
</template>

<script>
import UserTr from './tr/User.vue'

export default {
  components: {
    UserTr
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