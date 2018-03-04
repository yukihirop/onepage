export const user = {
  index: '/users',
  show: '/users/:id',
  create: '/users',
  update: '/users/:id',
  destroy: '/users/:id',
  like: {
    index: '/:mention_name/likes'
  }
}

export const post = {
  like: {
    index:   'posts/:post_id/post_likes',
    create:  'posts/:post_id/post_likes',
    destroy: 'posts/:post_id/post_likes/:id'
  }
}

export const revision = {
  index:  '/posts/:post_id/revisions',
  show:   '/posts/:post_id/revisions/:id',
  create: '/posts/:post_id/revisions',
  update: '/posts/:post_id/revisions/:id',
  destroy:'/posts/:post_id/revisions/:id'
}

export const setting = {
  profile: {
    show:   '/settings/profile',
    update: '/settings/profile'
  }
}
