<template lang="pug">
.container
  .columns
    aside.sidebar.column.is-2
      //- widthで幅を固定しないとスクロールした時に変わってしまう
      //- mybulma.scssを使っている時はtopは86にする必要がある。(原因不明)
      //- footerを設定することでbottmの設定を0から-128にする必要があった(原因不明)
      affix.menu.sidebar-menu(relative-element-selector='#non-affix-content', :offset='{ top: 86, bottom: -128 }', style='width: 160px')
        home-menu
    .column
      #non-affix-content
        router-view(name='table')
    .column.is-3
      #non-affix-content
        router-view(name='sidebar')
</template>

<script>
import HomeMenu from '../molecules/menu/HomeMenu.vue'

import Vue from 'vue'
import VueAffix from 'vue-affix'

Vue.use(VueAffix)

export default {
  components: {
    HomeMenu
  }
}
</script>

<!-- https://qiita.com/PoohSunny/items/ff78ed50332ddaf330a8 -->
<!-- navbar他のコンテンツ重なる -->
<style scoped lang="stylus">
.container
  //padding-top: 32px mybulma.scss使わない場合
  padding-top: 86px
</style>