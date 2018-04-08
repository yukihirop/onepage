var faker = require('faker')
faker.locale = 'ja'

export default {
  revision1: {
    id: 1,
    post_id: 1,
    title:      faker.lorem.sentence(),
    summary:    faker.lorem.text(),
    goal:       faker.lorem.text(),
    comment:    faker.lorem.text(),
    event_url:  faker.internet.url(),
    body:       faker.lorem.text(),
    slide_url:  faker.internet.url(),
    created_at: faker.date.recent(),
    updated_at: faker.date.recent()
  },
  revision2: {
    id: 2,
    post_id: 2,
    title:      faker.lorem.sentence(),
    summary:    faker.lorem.text(),
    goal:       faker.lorem.text(),
    comment:    faker.lorem.text(),
    event_url:  faker.internet.url(),
    body:       faker.lorem.text(),
    slide_url:  faker.internet.url(),
    created_at: faker.date.recent(),
    updated_at: faker.date.recent()
  }
}
