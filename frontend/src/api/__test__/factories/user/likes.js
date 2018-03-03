var faker = require('faker')
faker.locale = 'ja'

export default {
  Like: {
    like1: {
      id: 1,
      post_id: 1,
      user_id: 1,
      from_user_id: 3,
      created_at:   faker.date.recent(),
      updated_at:   faker.date.recent()
    },
    like2: {
      id: 2,
      post_id: 1,
      user_id: 1,
      from_user_id: 4,
      created_at:   faker.date.recent(),
      updated_at:   faker.date.recent()
    }
  }
}
