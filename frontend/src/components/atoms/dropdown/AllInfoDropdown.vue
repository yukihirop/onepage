<template lang="pug">
#dropdown-menu3.dropdown-menu(role='menu')
  .dropdown-content
    a.dropdown-item
      span.icon
        i.fa.fa-users
      span ユーザー一覧
    hr.dropdown-divider
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