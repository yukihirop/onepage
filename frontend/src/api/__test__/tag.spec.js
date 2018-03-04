import MockAdapter from 'axios-mock-adapter'
import client from '@/api/client'
import Tag from '@/api/model/tag'
import * as endpoints from '@/api/endpoints/index'
import factoryTag from '@/api/__test__/factories/tags'

var faker = require('faker')
faker.locale = 'ja'

const mockAxios = new MockAdapter(client)
const tag = new Tag(endpoints.tag)

const { tag1 } = factoryTag.tag1

describe('User', () => {
  describe('.index', () => {
    describe('onFulFilled', () => {
      const tags = [factoryTag.tag1, factoryTag.tag2]
      it('全てのタグ一覧を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/tags').reply(200, tags)
        return tag.index().then(res => {
          expect(res.data).toEqual(tags)
        })
      })
    })
  })
})
