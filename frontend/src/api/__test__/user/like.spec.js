import MockAdapter from 'axios-mock-adapter'
import client from '@/api/client'
import UserLike from '@/api/model/user/like'
import * as endpoints from '@/api/endpoints/index'
import factoryUser from '@/api/__test__/factories/user/likes'

var faker = require('faker')
faker.locale = 'ja'

const mockAxios = new MockAdapter(client)
const like = new UserLike(endpoints.user.like)

const { like1 } = factoryUser.Like.like1

describe('User.Like', () => {
  describe('.index', () => {
    describe('onFulFilled', () => {
      const likes = [factoryUser.Like.like1, factoryUser.Like.like2]
      it('ユーザーへの「いいね」を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/mention_name/likes').reply(200, likes)
        return like.index({ mention_name: 'mention_name' }).then(res => {
          expect(res.data).toEqual(likes)
        })
      })
    })
  })
})
