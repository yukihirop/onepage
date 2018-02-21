export const user = {
  index: '/users',
  show: '/users/:id',
  create: '/users',
  update: '/users/:id',
  destroy: '/users/:id'
}

export const post = {
  index: '/users/:user_id/posts',
  show: '/users/:user_id/posts/:id',
  create: '/users/:user_id/posts',
  update: '/users/:user_id/posts/:id',
  destroy: '/users/:user_id/posts/:id'
}

export const revision = {
  index: '/users/:user_id/posts/:post_id/revisions',
  show: '/users/:user_id/posts/:post_id/revisions/:id',
  create: '/users/:user_id/posts/:post_id/revisions',
  update: '/users/:user_id/posts/:post_id/revisions/:id',
  destroy: '/users/:user_id/posts/:post_id/revisions/:id'
}
