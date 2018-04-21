var moment = require('moment')

// @flow
export default class PostDecorator {
  resource: Object

  constructor (resource: Object) {
    this.resource = resource
  }

  who() {
    return this.resource.attributes.user.mention_name
  }

  when() {
    var created_at = this.resource.attributes.revision.created_at
    var formatted_created_at = moment(created_at).fromNow()
    return formatted_created_at
  }

  likes() {
    return this.resource.attributes["post-likings-count"]
  }

  title() {
    return this.resource.attributes.revision.title
  }

  organization() {
    return this.resource.attributes.profile.organization
  }

  summary() {
    return this.resource.attributes.revision.summary
  }
}
