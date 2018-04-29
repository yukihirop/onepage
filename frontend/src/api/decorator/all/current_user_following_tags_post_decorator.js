var moment = require('moment')

// @flow
export default class CurrentUserFollowingTagsPostDecorator {
  resource: Object

  constructor (resource: Object) {
    this.resource = resource
  }

  data() {
    return {
      tag: this.tag(),
      when: this.when(),
      title: this.title(),
      organization: this.organization(),
      summary: this.summary()
    }
  }

  tag() {
    return this.resource.attributes.tags[0].name
  }

  when() {
    var created_at = this.resource.attributes.revision.created_at
    var formatted_created_at = moment(created_at).fromNow()
    return formatted_created_at
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
