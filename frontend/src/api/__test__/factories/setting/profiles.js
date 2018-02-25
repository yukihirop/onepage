var faker = require('faker')
faker.locale = 'ja'

export default {
  Profile: {
    profile1: {
      id: 1,
      user_id: 1,
      name:         faker.name.firstName() + faker.name.lastName(),
      kana:         faker.name.firstName() + faker.name.lastName(),
      organization: faker.lorem.text(),
      introduction: faker.lorem.text(),
      image:        faker.image.people(),
      created_at:   faker.date.recent(),
      updated_at:   faker.date.recent()
    },
    profile2: {
      id: 2,
      user_id: 2,
      name:         faker.name.firstName() + faker.name.lastName(),
      kana:         faker.name.firstName() + faker.name.lastName(),
      organization: faker.lorem.text(),
      introduction: faker.lorem.text(),
      image:        faker.image.people(),
      created_at:   faker.date.recent(),
      updated_at:   faker.date.recent()
    }
  }
}
