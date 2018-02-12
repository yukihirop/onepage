var faker = require("faker")
faker.locale = "ja"

var users = () => {
  const data = { users: [] }
  for(let i = 1; i < 11; i++) {
    data.users.push(
    {
      id: i,
      email: faker.internet.email(),
      password: faker.internet.password()
    })
  }
  return data['users']
}

var posts = () => {
  const data = { posts: [] }
  users().forEach( user => {
    for(let i = 1; i < 11; i++) {
      data.posts.push(
      {
        id: i,
        userId: user.id,
        newest_revision_id: 1,
      })
    }
  })
  return data['posts']
}

var revisions = () => {
  const data = { revisions: [] }
  posts().forEach( post => {
    for(let i = 1; i < 4; i++) {
      data.revisions.push(
      {
        id:        i,
        postId:    post.id,
        title:     faker.lorem.words(),
        summary:   faker.lorem.sentences(),
        goal:      faker.lorem.words(),
        comment:   faker.lorem.sentences(),
        event_url: faker.internet.ip(),
        body:      faker.lorem.sentences(),
        slide_url: faker.internet.ip()
      })
    }
  })
  return data['revisions']
}


module.exports = () => {
  var result =
  {
    users: users(),
    posts: posts(),
    revisions: revisions()
  }

  return result
}