<template lang="pug">
  .cart
    h1.title Your Cart
    p(v-show='!products.length')
      i Your cart is empty!
      router-link(to='/') Go shopping

    table.table.is-striped(v-show='products.length')
      thead
        tr
          td Name
          td Price
          td Quantity
      tbody
        tr(v-for='product in products')
          td {{ product.name }}
          td {{ product.price }}
          td {{ product.quantity }}
        tr
          td
            b Total:
          td
          td
            b ${{ total }}
    p
      button.button.is-primary(v-show='products.length', @click='checkout') Checkout
</template>

<script>
import { mapGetters } from 'vuex'
const namespace = 'shoppingModule'

export default {
  computed: {
    ...mapGetters(namespace, {
      products: 'cartProducts'
    }),
    total () {
      return this.products.reduce((total, product) => 
      {
        return total + product.price * product.quantity
      }, 0)
    }
  },
  methods: {
    checkout () {
      alert('Play us $' + this.total)
    }
  }
}
</script>