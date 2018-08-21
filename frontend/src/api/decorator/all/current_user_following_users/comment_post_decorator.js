var moment = require('moment')

// @flow
export default class CurrentUserFollowingUsersCommentPostDecorator {
  resource: Object

  constructor(recource: Object){
    this.resource = resource
  }

  data(){
    return {
      who:         this.who(),
      when:        this.when(),
      comment:     this.comment(),
      refTitle:    this.refTitle(),
      refComments: this.refComments(),
      actionType:  this.actionType()
    }
  }

  who(){
    return this.resource.attributes['follower-profile'].name
  }

  when(){
    var created_at = this.resource.attributes.revision.created_at
    var formatted_created_at = moment(created_at).fromNow()
    return formatted_created_at
  }

  comment(){
    return this.resource.attributes.comment.body
  }

  refTitle(){
    return this.resource.attributes.revision.title
  }

  refComments(){
    return this.resource.attributes['resource-count']
  }

  actionType(){
    return this.resource.attributes['action-type']
  }
}
