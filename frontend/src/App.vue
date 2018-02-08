<template lang="pug">
 #app
  shared-nav-bar
  router-view
</template>

<script>
import SharedNavBar from './components/organisms/navbar/SharedNavBar.vue'

export default {
  name: 'app',
  components: {
    SharedNavBar
  }
}
</script>

<style lang="stylus">
#app
  font-family: 'Avenir', Helvetica, Arial, sans-serif
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  text-align: center
  color: #2c3e50
  background-color: #F5F5F5
h1, h2
  font-weight: normal
ul
  list-style-type: none
  padding: 0
li
  display: inline-block
  margin: 0 10px
a
  color: #42b983
</style>
