<template lang="pug">
#dropdown-menu3.dropdown-menu(role='menu')
  .dropdown-content
    a.dropdown-item(href='#')
      | マイページ
    hr.dropdown-divider
    a.dropdown-item(href='#')
      | 下書き一覧
    a.dropdown-item(href='#')
      | 通知一覧
    hr.dropdown-divider
    a.dropdown-item(href='#')
      | ヘルプ
    hr.dropdown-divider
    a.dropdown-item(href='#')
      | ログアウト
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
.dropdown-content
  text-align: left
</style>