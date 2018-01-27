<template lang="pug">
b-navbar(fixed='top', toggleable='md', type='dark', variant='info')
  b-navbar-toggle(target='nav_collapse')
  b-navbar-brand(href='#') NavBar
  b-collapse#nav_collapse(is-nav='')
    b-navbar-nav
      b-nav-item(href='#') Link
      b-nav-item(href='#', disabled='') Disabled
    // Right aligned nav items
    b-navbar-nav.ml-auto
      b-nav-form
        b-form-input.mr-sm-2(size='sm', type='text', placeholder='Search')
          b-button.my-2.my-sm-0(size='sm', type='submit') Search
      b-nav-item-dropdown(text='Lang', right='')
        b-dropdown-item(href='#') EN
        b-dropdown-item(href='#') ES
        b-dropdown-item(href='#') RU
        b-dropdown-item(href='#') FA
      b-nav-item-dropdown(right='')
        // Using button-content slot
        template(slot='button-content')
          em User
        b-dropdown-item(href='#') Profile
        b-dropdown-item(href='#') Signout
</template>