import MockAdapter from 'axios-mock-adapter'
import client from '../client'
import Post from '../model/post'
import * as endpoints from '../endpoints'
import factoryPost from './factories/posts'
import '../../../env-config'

var faker = require('faker')
faker.locale = 'ja'

const mockAxios = new MockAdapter(client)
const post = new Post(endpoints.post)

const { post1 } = factoryPost.post1

describe('Post', () => {
  describe('.index', () => {
    describe('onFulFilled', () => {
      const posts = [factoryPost.post1, factoryPost.post2]
      it('全ての投稿(内容あり)を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/posts').reply(200, posts)
        return post.index().then(res => {
          expect(res.data).toEqual(posts)
        })
      })
    })
  })

  describe('.show', () => {
    describe('onFulFilled', () => {
      it('idで指定された投稿(内容あり)を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/posts/1').reply(200, post1)
        return post.show({ id: 1 }).then(res => {
          expect(res.data).toEqual(post1)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        mockAxios.onGet('/posts/3').reply(404)
        return post.show({ id: 3 }).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
  })

  describe('.create', () => {
    describe('onFulFilled', () => {
      it('投稿(内容あり)を作成できる', () => {
        expect.assertions(1)
        const postParams  = { id: 3, revisions_attributes: { title: 'create'} }
        // このidはrevisionモデルに割り振られているサロゲートキー
        const createdPost = { id: 1, post_id: 3, title: 'create' }
        mockAxios.onPost('/posts').reply(204, createdPost)
        return post.create(postParams).then(res => {
          expect(res.data).toEqual(createdPost)
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        const postParams = { id: 3, revisions_attributes: { title: 'create'} }
        mockAxios.onGet('/posts').reply(422)
        return post.create(postParams).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })

  describe('.update', () => {
    describe('onFulFilled', () => {
      it('投稿のtitleが更新される', () => {
        expect.assertions(1)
        const updateParams = { id: 1, revisions_attributes: { title: 'update' } }
        // このidはrevisionモデルに割り振られているサロゲートキー
        const updatedpost =  { id: 1, post_id: 1, title: 'update' }
        mockAxios.onPut('/posts/1').reply(200, updatedpost)
        return post.update(updateParams).then(res => {
          expect(res.data).toEqual(updatedpost)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        const updateParams = { id: 1, revisions_attributes: { title: 'update' } }
        mockAxios.onPut('/posts/1').reply(404)
        return post.update(updateParams).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        const updateParams = { id: 1, revisions_attributes: { title: 'update' } }
        mockAxios.onPut('/posts/1').reply(422)
        return post.update(updateParams).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })

  describe('.destroy', () => {
    describe('onFulFilled', () => {
      it('投稿(内容あり)が削除される', () => {
        expect.assertions(1)
        mockAxios.onDelete('/posts/1').reply(200, post1)
        return post.destroy({ id: 1 }).then(res => {
          expect(res.data).toEqual(post1)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        mockAxios.onDelete('/posts/1').reply(404)
        return post.destroy({ id: 1 }).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        mockAxios.onDelete('/posts/1').reply(422)
        return post.destroy({ id: 1 }).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })
})
