<template lang="pug">
.a-trend-table-title.panel-block
  .a-trend-table-title-icon-and-title
    .panel-icon
      i.fa.fa-bar-chart.fa-2x.trend
    .title.is-6 トレンド
  .a-trend-table-title-subtitle
    .title.is-7 ここ数時間で人気を集めている記事
</template>

<style scoped lang="stylus">
$theme_color = #0081C1

.a-trend-table-title
  background-color: $theme_color
  
  &-icon-and-title
    display: flex
    flex-direction: row
    align-items: center
    width: 150px
    .trend
      color: white
    .title
      color: white
  &-subtitle
    .title
      color: white
      padding-left: 1.0em
</style>