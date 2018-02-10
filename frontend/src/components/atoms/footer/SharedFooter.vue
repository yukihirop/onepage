<template lang="pug">
footer.footer
  .container
    .a-shared-footer
      .a-shared-footer-onepage
        a(style='color: #0081C1;') OnePageとは
      .a-shared-footer-terms
        a(style='color: #0081C1;') 利用規約
      .a-shared-footer-privacy
        a(style='color: #0081C1;') プライバシー
      .a-shared-footer-help
        a(style='color: #0081C1;') ヘルプ
      .a-shared-footer-contact
        a(style='color: #0081C1;') お問合わせ
</template>

<style scoped lang="stylus">
$child_to_child_margin = 10px
$theme_color = #0081C1

.a-shared-footer
  display: flex
  flex-direction: row
  justify-content: flex-end
  &-onepage
  &-terms
    margin-left: $child_to_child_margin
  &-privacy
    margin-left: $child_to_child_margin
  &-help
    margin-left: $child_to_child_margin
  &-contact
    margin-left: $child_to_child_margin
</style>