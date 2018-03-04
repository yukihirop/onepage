var faker = require('faker')
faker.locale = 'ja'

export default {
  tag1: {
    id: 1,
    name: faker.lorem.text(),
    created_at: faker.date.recent(),
    updated_at: faker.date.recent(),
    post_taggings: [],
    post_count: faker.random.number()
  },
  tag2: {
    id: 2,
    name: faker.lorem.text(),
    created_at: faker.date.recent(),
    updated_at: faker.date.recent(),
    post_taggings: [],
    post_count: faker.random.number()
  }
}
