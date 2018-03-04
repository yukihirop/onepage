import MockAdapter from 'axios-mock-adapter'
import client from '@/api/client'
import CurrentUserRevision from '@/api/model/current_user/revision'
import * as currentUserEndpoints from '@/api/endpoints/current_user/index'
import factoryRevision from '@/api/__test__/factories/revisions'

var faker = require('faker')
faker.locale = 'ja'

const mockAxios = new MockAdapter(client)
const currentUserRevision = new CurrentUserRevision(currentUserEndpoints.revision)

const { revision1 } = factoryRevision.revision1

describe('CurrentUserRevision', () => {
  describe('.index', () => {
    describe('onFulFilled', () => {
      const revisions = [factoryRevision.revision1, factoryRevision.revision2]
      it('カレントユーザーの投稿に紐付いた全ての改訂履歴を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/current_user/posts/1/revisions').reply(200, revisions)
        return currentUserRevision.index({ post_id: 1 }).then(res => {
          expect(res.data).toEqual(revisions)
        })
      })
    })
  })

  describe('.show', () => {
    describe('onFulFilled', () => {
      it('カレントユーザーの投稿に紐付いたidで指定された改訂履歴を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/current_user/posts/1/revisions/1').reply(200, revision1)
        return currentUserRevision.show({ post_id: 1, id: 1 }).then(res => {
          expect(res.data).toEqual(revision1)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        mockAxios.onGet('/current_user/posts/1/revisions/3').reply(404)
        return currentUserRevision.show({ post_id: 1, id: 3 }).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
  })
})
