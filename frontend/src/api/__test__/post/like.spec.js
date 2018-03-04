import MockAdapter from 'axios-mock-adapter'
import client from '@/api/client'
import PostLike from '@/api/model/post/like'
import * as endpoints from '@/api/endpoints/index'
import factoryPost from '@/api/__test__/factories/post/likes'

var faker = require('faker')
faker.locale = 'ja'

const mockAxios = new MockAdapter(client)
const like = new PostLike(endpoints.post.like)

const { like1 } = factoryPost.Like.like1

describe('PostLike', () => {
  describe('.index', () => {
    describe('onFulFilled', () => {
      const likes = [factoryPost.Like.like1, factoryPost.Like.like2]
      it('投稿への全ての「いいね」を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/posts/1/post_likes').reply(200, likes)
        return like.index({ post_id: 1 }).then(res => {
          expect(res.data).toEqual(likes)
        })
      })
    })
  })

  describe('.create', () => {
    describe('onFulFilled', () => {
      it('投稿(内容あり)を作成できる', () => {
        expect.assertions(1)
        const likeParams = { post_id: 1, from_user_id: 2 }
        // このidはrevisionモデルに割り振られているサロゲートキー
        const createdLike = { id: 3, post_id: 1, from_user_id: 2 }
        mockAxios.onPost('/posts/1/post_likes').reply(204, createdLike)
        return like.create(likeParams).then(res => {
          expect(res.data).toEqual(createdLike)
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        const likeParams = { post_id: 1, from_user_id: 2 }
        mockAxios.onGet('/posts/1/post_likes').reply(422)
        return like.create(likeParams).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })

  describe('.destroy', () => {
    describe('onFulFilled', () => {
      it('投稿(内容あり)が削除される', () => {
        expect.assertions(1)
        mockAxios.onDelete('/posts/1/post_likes/1').reply(200, like1)
        return like.destroy({ id: 1, post_id: 1 }).then(res => {
          expect(res.data).toEqual(like1)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        mockAxios.onDelete('/posts/1/post_likes/1').reply(404)
        return like.destroy({ id: 1, post_id: 1 }).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        mockAxios.onDelete('/posts/1/post_likes/1').reply(422)
        return like.destroy({ id: 1, post_id: 1 }).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })
})
