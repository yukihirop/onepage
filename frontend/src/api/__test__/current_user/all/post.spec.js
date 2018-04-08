import MockAdapter from 'axios-mock-adapter'
import client from '@/api/client'
import CurrentUserPost from '@/api/model/current_user/all/post'
import * as currentUserEndpoints from '@/api/endpoints/current_user/index'
import factoryPost from '@/api/__test__/factories/current_user/all/posts'

var faker = require('faker')
faker.locale = 'ja'

const mockAxios = new MockAdapter(client)
const currentUserPost = new CurrentUserPost(currentUserEndpoints.post)

const { post1 } = factoryPost.post1

describe('CurrentUserPost', () => {
  describe('.index', () => {
    describe('onFulFilled', () => {
      const posts = [factoryPost.post1, factoryPost.post2]
      it('カレントユーザーの全ての投稿(内容あり)を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/current_user/posts').reply(200, posts)
        return currentUserPost.index().then(res => {
          expect(res.data).toEqual(posts)
        })
      })
    })
  })

  describe('.show', () => {
    describe('onFulFilled', () => {
      it('カレントユーザーのidで指定された投稿(内容あり)を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/current_user/posts/1').reply(200, post1)
        return currentUserPost.show({ id: 1 }).then(res => {
          expect(res.data).toEqual(post1)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        mockAxios.onGet('/current_user/posts/3').reply(404)
        return currentUserPost.show({ id: 3 }).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
  })

  describe('.create', () => {
    describe('onFulFilled', () => {
      it('カレントユーザーの投稿(内容あり)を作成できる', () => {
        expect.assertions(1)
        const postParams  = { id: 3, revisions_attributes: { title: 'create'} }
        // このidはrevisionモデルに割り振られているサロゲートキー
        const createdPost = { id: 1, post_id: 3, title: 'create' }
        mockAxios.onPost('/current_user/posts').reply(204, createdPost)
        return currentUserPost.create(postParams).then(res => {
          expect(res.data).toEqual(createdPost)
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        const postParams = { id: 3, revisions_attributes: { title: 'create'} }
        mockAxios.onGet('/current_user/posts').reply(422)
        return currentUserPost.create(postParams).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })

  describe('.update', () => {
    describe('onFulFilled', () => {
      it('カレントユーザーの投稿のtitleが更新される', () => {
        expect.assertions(1)
        const updateParams = { id: 1, revisions_attributes: { title: 'update' } }
        // このidはrevisionモデルに割り振られているサロゲートキー
        const updatedpost =  { id: 1, post_id: 1, title: 'update' }
        mockAxios.onPut('/current_user/posts/1').reply(200, updatedpost)
        return currentUserPost.update(updateParams).then(res => {
          expect(res.data).toEqual(updatedpost)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        const updateParams = { id: 1, revisions_attributes: { title: 'update' } }
        mockAxios.onPut('/current_user/posts/1').reply(404)
        return currentUserPost.update(updateParams).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        const updateParams = { id: 1, revisions_attributes: { title: 'update' } }
        mockAxios.onPut('/current_user/posts/1').reply(422)
        return currentUserPost.update(updateParams).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })

  describe('.destroy', () => {
    describe('onFulFilled', () => {
      it('カレントユーザーの投稿(内容あり)が削除される', () => {
        expect.assertions(1)
        mockAxios.onDelete('/current_user/posts/1').reply(200, post1)
        return currentUserPost.destroy({ id: 1 }).then(res => {
          expect(res.data).toEqual(post1)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        mockAxios.onDelete('/current_user/posts/1').reply(404)
        return currentUserPost.destroy({ id: 1 }).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        mockAxios.onDelete('/current_user/posts/1').reply(422)
        return currentUserPost.destroy({ id: 1 }).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })
})
