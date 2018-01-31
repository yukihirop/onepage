<template lang="pug">
nav.navbar.is-primary.is-fixed-top
  .container
    .navbar-brand
      a.navbar-item(href='https://bulma.io')
        img(src='https://bulma.io/images/bulma-logo.png', alt='Bulma: a modern CSS framework based on Flexbox', width='112', height='28')
      .navbar-burger.burger(data-target='navbarExampleTransparentExample')
        span
        span
        span
    #navbarExampleTransparentExample.navbar-menu
      .navbar-start
        a.navbar-item(href='https://bulma.io/')
          | Home
        .navbar-item.has-dropdown.is-hoverable
          a.navbar-link(href='/documentation/overview/start/')
            | Docs
          .navbar-dropdown.is-boxed
            a.navbar-item(href='/documentation/overview/start/')
              | Overview
            a.navbar-item(href='https://bulma.io/documentation/modifiers/syntax/')
              | Modifiers
            a.navbar-item(href='https://bulma.io/documentation/columns/basics/')
              | Columns
            a.navbar-item(href='https://bulma.io/documentation/layout/container/')
              | Layout
            a.navbar-item(href='https://bulma.io/documentation/form/general/')
              | Form
            hr.navbar-divider
            a.navbar-item(href='https://bulma.io/documentation/elements/box/')
              | Elements
            a.navbar-item.is-active(href='https://bulma.io/documentation/components/breadcrumb/')
              | Components
      .navbar-end
        .navbar-item
          .field.is-grouped
            p.control
              a.bd-tw-button.button(data-social-network='Twitter', data-social-action='tweet', data-social-target='http://localhost:4000',   target='_blank', href='https://twitter.com/intent/tweet?text=Bulma: a modern CSS framework based on   Flexbox&hashtags=bulmaio&url=http://localhost:4000&via=jgthms')
                span.icon
                  i.fa.fa-twitter
                span
                  | Tweet
            p.control
              a.button.is-primary(href='https://github.com/jgthms/bulma/archive/0.5.1.zip')
                span.icon
                  i.fa.fa-download
                span Download
</template>