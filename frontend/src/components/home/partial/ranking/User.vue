<template lang="pug">
nav.panel
  p.panel-heading
    | ユーザー・ランキング
  p.panel-tabs
    a.is-active 週間
    a 月間
    a 全て
  table.table.is-borderd(style="width: 320px;")
    tbody(style="height: 64px")
      user-tr(rank=1,  imageSrc='https://bulma.io/images/placeholders/32x32.png', username='aimerald',    mentionname='aimerald', likes=999)
      user-tr(rank=2,  imageSrc='https://bulma.io/images/placeholders/32x32.png', username='Yuma Inaura', mentionname='yinaura',  likes=9999)
      user-tr(rank=3,  imageSrc='https://bulma.io/images/placeholders/32x32.png', username='Yuma Inaura', mentionname='yinaura',  likes=8888)
      user-tr(rank=4,  imageSrc='https://bulma.io/images/placeholders/32x32.png', username='Yuma Inaura', mentionname='yinaura',  likes=7777)
      user-tr(rank=5,  imageSrc='https://bulma.io/images/placeholders/32x32.png', username='Yuma Inaura', mentionname='yinaura',  likes=6666)
      user-tr(rank=6,  imageSrc='https://bulma.io/images/placeholders/32x32.png', username='Yuma Inaura', mentionname='yinaura',  likes=5555)
      user-tr(rank=7,  imageSrc='https://bulma.io/images/placeholders/32x32.png', username='Yuma Inaura', mentionname='yinaura',  likes=4444)
      user-tr(rank=8,  imageSrc='https://bulma.io/images/placeholders/32x32.png', username='Yuma Inaura', mentionname='yinaura',  likes=333)
      user-tr(rank=9,  imageSrc='https://bulma.io/images/placeholders/32x32.png', username='Yuma Inaura', mentionname='yinaura',  likes=22)
      user-tr(rank=10, imageSrc='https://bulma.io/images/placeholders/32x32.png', username='yukihirop',   mentionname='yukihirop',likes=1)
</template>

<script>
import UserTr from './tr/User.vue'

export default {
  components: {
    UserTr
  }
}
</script>

<style scoped lang="stylus">
.panel-heading
  padding-bottom: 0px
  margin-bottom: 0px
.panel-tabs
  padding-bottom: 0px
  margin-bottom: 0px
</style>