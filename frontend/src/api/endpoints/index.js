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
