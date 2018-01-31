<template lang="pug">
.container
  .columns
    aside.sidebar.column.is-2
      //- widthで幅を固定しないとスクロールした時に変わってしまう
      affix.menu.sidebar-menu(relative-element-selector='#non-affix-content', :offset='{ top: 32, bottom: 0 }', style='width: 160px')
        menu-list
    .column
      #non-affix-content
        router-view(name='main-table')
    .column.is-3
      #non-affix-content
        router-view(name='ranking')
</template>

<script>
import MenuList from './MenuList.vue'

import Vue from 'vue'
import VueAffix from 'vue-affix'

Vue.use(VueAffix)

export default {
  components: {
    MenuList
  }
}
</script>

<!-- https://qiita.com/PoohSunny/items/ff78ed50332ddaf330a8 -->
<!-- navbar他のコンテンツ重なる -->
<style scoped lang="stylus">
.container
  padding-top: 32px
</style>