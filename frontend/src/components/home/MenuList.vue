<template lang="pug">
nav.panel
  router-link.panel-block(to='/trend')
    span.panel-icon
      i.fa.fa-bar-chart
    |     トレンド
  router-link.panel-block(to='/timeline' exact)
    span.panel-icon
      i.fa.fa-list-ul
    |     タイムライン
  router-link.panel-block(to='/tagfeed' exact)
    span.panel-icon
      i.fa.fa-tags
    |     タグフィード
</template>

<style scoped lang="stylus">
.panel
  background-color: white
</style>
