<template lang='pug'>
  nav.nav.has-shadow(style='box-shadow: 0 1px 0 rgba(219,219,219,.3);')
    .nav-left
      router-link.nav-item(to='/' )
        img(src='../../assets/logo.png', alt='Bulma logo')

    span.nav-toggle
      span
      span
      span

    .nav-right.nav-menu
      router-link.nav-item.is-tab(to='/',
      exact-active-class='is-active') Shop

      .nav-item.is-tab(:class="{'active-bottom-border': $route.path === '/cart'}")
        .field.is-grouped
          p.control
            router-link.button.is-info(to='/cart')
              span.icon
                i.fa.fa-shopping-cart
              span Checkout {{ itemsInCart }}
</template>

<script>
import { mapGetters } from 'vuex'
const namespace = 'shoppingModule'

export default {
  computed: {
    ...mapGetters(namespace, {
      products: 'cartProducts'
    }),
    itemsInCart () {
      let cart = this.$store.getters[namespace + '/cartProducts']
      return cart.reduce((accum, item) => accum + item.quantity, 0)
    }
  }
}
</script>

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
