var faker = require('faker')
faker.locale = 'ja'

export default {
  user1: {
    id: 1,
    email: faker.internet.email(),
    created_at: faker.date.recent(),
    updated_at: faker.date.recent()
  },
  user2: {
    id: 2,
    email: faker.internet.email(),
    created_at: faker.date.recent(),
    updated_at: faker.date.recent()
  }
}
