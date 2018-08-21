import CurrentUserFollowingUsersPostPostDecorator       from '@/api/decorator/all/current_user_following_users/post_post_decorator'
import CurrentUserFollowingUsersPostLikingPostDecorator from '@/api/decorator/all/current_user_following_users/post_liking_post_decorator'
import CurrentUserFollowingUsersCommentPostDecorator    from '@/api/decorator/all/current_user_following_users/comment_post_decorator'

// @flow
export default class CurrentUserFollowingUsersPostDecorator {
  resource: Object

  constructor(resource: Object) {
    this.resource = resource
  }

  build(){
    var decorator

    if(this.action_type() === 'post'){
      decorator = new CurrentUserFollowingUsersPostPostDecorator(this.resource)
    } else if (this.action_type() === 'post_liking'){
      decorator = new CurrentUserFollowingUsersPostPostDecorator(this.resource)
    } else if (this.action_type() === 'comment'){
      decorator = new CurrentUserFollowingUsersCommentPostDecorator(this.resource)
    }

    return decorator
  }

  action_type(){
    return this.resource.attributes['action-type']
  }
}
