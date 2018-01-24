<template lang='pug'>
  nav.nav.has-shadow(style='box-shadow: 0 1px 0 rgba(219,219,219,.3);')
    .nav-left
      router-link.nav-item(to='/' )
        img(src='../../assets/logo.png', alt='Bulma logo')

    span.nav-toggle
      span
      span
      span
</template>

<style lang='stylus'>
.nav
  height auto
  margin-bottom 2rem

.nav-item
  img
    max-height 3.5rem

.active-bottom-border
  border-bottom 3px solid #00d1b2
  color #00d1b2
  padding-bottom calc(.75rem - 8px)
</style>
