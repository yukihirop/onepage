export const post = {
  index:  '/current_user/posts',
  show:   '/current_user/posts/:id',
  create: '/current_user/posts',
  update: '/current_user/posts/:id',
  destroy:'/current_user/posts/:id'
}

export const revision = {
  index:  '/current_user/posts/:post_id/revisions',
  show:   '/current_user/posts/:post_id/revisions/:id',
  create: '/current_user/posts/:post_id/revisions',
  update: '/current_user/posts/:post_id/revisions/:id',
  destroy:'/current_user/posts/:post_id/revisions/:id'
}

export const setting = {
  profile: {
    show:   '/current_user/settings/profile',
    update: '/current_user/settings/profile'
  }
}
