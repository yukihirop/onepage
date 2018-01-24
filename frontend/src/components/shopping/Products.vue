<template lang="pug">
  div
    h1.title All Products
      p {{ length }} products
      table.table.is-striped
        thead
          tr
            th Name
            th Description
            th Price
        tbody
          tr(v-for='product in products' track-by='id')
            td {{ product.name }}
            td {{ product.description }}
            td ${{ product.price }}
            td
              button.button.is-info(@click='addToCart(product)') Add to cart
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
const namespace = 'shoppingModule'

export default {
  name: 'app',
  computed: mapGetters(namespace, {
    products: 'allProducts',
    length: 'getNumberOfProducts'
  }),
  methods: mapActions(namespace, [
    'addToCart'
  ])
}
</script>