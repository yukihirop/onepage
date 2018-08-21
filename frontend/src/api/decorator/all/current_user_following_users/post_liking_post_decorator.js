import PostDecorator from '@/api/decorator/all/current_user_following_users/post_decorator'

// @flow
export default class CurrentUserFollowingUsersPostLikingPostDecorator extends PostDecorator {
  resource: Object

  constructor(resource: Object){
    super(resource)
  }

  data(){
    return {
      who:          this.who(),
      when:         this.when(),
      title:        this.title(),
      organization: this.organization(),
      summary:      this.summary(),
      actionType:   this.actionType()
    }
  }

  actionType(){
    return this.resource.attributes['action-type']
  }
}
