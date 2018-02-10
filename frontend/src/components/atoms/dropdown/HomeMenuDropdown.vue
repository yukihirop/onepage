<template lang="pug">
.dropdown-content
  router-link(to='/trend').dropdown-item
    span.icon
      i.fa.fa-bar-chart
    span トレンド
  router-link(to='/timeline' exact).dropdown-item
    span.icon
      i.fa.fa-list-ul
    span タイムライン
  router-link(to='/tagfeed' exact).dropdown-item
    span.icon
      i.fa.fa-tags
    span タグ・フィード
</template>

<script>
import listener from '../../mixins/dropdown.js'

export default {
  mixins: [listener],
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
.dropdown-item
  text-align: left
</style>