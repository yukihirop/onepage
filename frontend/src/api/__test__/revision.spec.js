import MockAdapter from 'axios-mock-adapter'
import client from '../client'
import Revision from '../model/revision'
import * as endpoints from '../endpoints'
import factoryRevision from './factories/revisions'
import '../../../env-config'

var faker = require('faker')
faker.locale = 'ja'

const mockAxios = new MockAdapter(client)
const revision = new Revision(endpoints.revision)

const { revision1 } = factoryRevision.revision1

describe('Revision', () => {
  describe('.index', () => {
    describe('onFulFilled', () => {
      const revisions = [factoryRevision.revision1, factoryRevision.revision2]
      it('投稿に紐付いた全ての改訂履歴を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/posts/1/revisions').reply(200, revisions)
        return revision.index({ post_id: 1 }).then(res => {
          expect(res.data).toEqual(revisions)
        })
      })
    })
  })

  describe('.show', () => {
    describe('onFulFilled', () => {
      it('投稿に紐付いたidで指定された改訂履歴を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/posts/1/revisions/1').reply(200, revision1)
        return revision.show({ post_id: 1, id: 1 }).then(res => {
          expect(res.data).toEqual(revision1)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        mockAxios.onGet('/posts/1/revisions/3').reply(404)
        return revision.show({ post_id: 1, id: 3 }).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
  })
})
