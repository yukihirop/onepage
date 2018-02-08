<template lang="pug">
nav.navbar.is-primary.is-fixed-top
  .container
    .navbar-brand
      a.navbar-item(href='https://bulma.io')
        img(src='../../assets/OnePage.png', alt='OnePage', width='160', height='30')
      .navbar-burger.burger(data-target='navbarExampleTransparentExample')
        span
        span
        span
    #navbarExampleTransparentExample.navbar-menu
      .navbar-start
        .navbar-item
          .dropdown.is-active.home-menu
            .dropdown-trigger
              a(aria-haspopup='true', aria-controls='dropdown-menu3' v-on:click.stop="showHomeMenu")
                span ホーム
                span.icon.is-small
                  i.fa.fa-angle-down(aria-hidden='true')
            home-menu(v-if="isShowHomeMenu" v-on:close="isShowHomeMenu = false")
          .dropdown.is-active.all-info
            .dropdown-trigger
              a(aria-haspopup='true', aria-controls='dropdown-menu3' v-on:click.stop="showAllInfo")
                span みんなの情報
                span.icon.is-small
                  i.fa.fa-angle-down(aria-hidden='true')
            all-info(v-if="isShowAllInfo" v-on:close="isShowAllInfo = false")
          .field
            p.control.has-icons-left.search
              input.input(type='password', placeholder='キーワードを入力')
              span.icon.is-small.is-left
                i.fa.fa-search
      .navbar-end
        .navbar-item
          a.stock-index
            span.icon
              i.fa.fa-folder-open
            span ストック一覧
          a.button.post-index
            span.icon
              i.fa.fa-pencil
            span 投稿一覧
          .dropdown.notification-list(v-bind:class="{ 'is-active': isShowNotificationList }")
            .dropdown-trigger
              button.button(aria-haspopup='true', aria-controls='dropdown-menu3' v-on:click.stop="showNotificationList" v-bind:class="setDanger")
                span {{ notifications }}
            notification-list(v-if="isShowNotificationList" v-on:close="isShowNotificationList = false")
          .dropdown.user-menu(v-bind:class="{ 'is-active': isShowUserMenu }")
            .dropdown-trigger
              button.button(aria-haspopup='true', aria-controls='dropdown-menu3' v-on:click.stop="showUserMenu")
                span yukihirop
                span.icon.is-small
                  i.fa.fa-angle-down(aria-hidden='true')
            user-menu(v-if="isShowUserMenu" v-on:close="isShowUserMenu = false")
</template>

<script>
import UserMenu from './navbar/UserMenu.vue'
import NotificationList from './navbar/NotificationList.vue'
import HomeMenu from './navbar/HomeMenu.vue'
import AllInfo from './navbar/AllInfo.vue'

export default {
  components: {
    UserMenu,
    NotificationList,
    HomeMenu,
    AllInfo
  },
  props: {
    notifications: {
      type: Number,
      required: true
    },
    isShowUserMenu: {
      type: Boolean,
      required: true
    },
    isShowNotificationList: {
      type: Boolean,
      required: true
    },
    isShowHomeMenu: {
      type: Boolean,
      required: true
    },
    isShowAllInfo: {
      type: Boolean,
      required: true
    }
  },
  data: {
    isShowUserMenu: false,
    isShowNotificationList: false,
    isShowAllInfo: false,
    isShowHomeMenu: false,
    notifications: this.notifications
  },
  mounted: function () {
    this.notifications = 4
  },
  updated: function () {
    this.notifications = 4
  },
  computed: {
    setDanger: function () {
      return {
        'is-danger': this.notifications
      }
    },
    canShowMenu: function () {
      return !(this.isShowUserMenu || this.isShowNotificationList || this.isShowHomeMenu || this.isShowAllInfo)
    }
  },
  // 算術プロパティにすると無限ループになる
  methods: {
    showUserMenu: function () {
      if (this.canShowMenu || this.isShowUserMenu) {
        this.isShowUserMenu = !this.isShowUserMenu
      }
    },
    showNotificationList: function () {
      if (this.canShowMenu || this.isShowNotificationList) {
        this.isShowNotificationList = !this.isShowNotificationList
      }
    },
    showAllInfo: function () {
      if (this.canShowMenu || this.isShowAllInfo) {
        this.isShowAllInfo = !this.isShowAllInfo
      }
    },
    showHomeMenu: function () {
      if (this.canShowMenu || this.isShowHomeMenu) {
        this.isShowHomeMenu = !this.isShowHomeMenu
      }
    }
  }
}
</script>

<style scoped lang="stylus">
$theme_color_dark = #004F76
$between_menu_margin = 15px

.home-menu
  a
    color: white
.all-info
  margin-left: $between_menu_margin
  a
    color: white
.search
  margin-left: $between_menu_margin

.stock-index
  color: white
.post-index
  border: none
  color: white
  background-color: $theme_color_dark
  margin-left: $between_menu_margin
.notification-list
  margin-left: $between_menu_margin
.user-menu
  margin-left: $between_menu_margin
</style>