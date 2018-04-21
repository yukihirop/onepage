import MockAdapter from 'axios-mock-adapter'
import client from '@/api/client'
import Post from '@/api/model/all/post'
import * as endpoints from '@/api/endpoints/index'
import factoryPost from '@/api/__test__/factories/all/posts'

const mockAxios = new MockAdapter(client)
const post = new Post(endpoints.post)

describe('Post', () => {
  describe('.index', () => {
    describe('onFulFilled', () => {
      const posts = [factoryPost.data]
      it('全ての投稿一覧を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/posts').reply(200, posts)
        return post.index().then(res => {
          expect(res.data).toEqual(posts)
        })
      })
    })
  })

  describe('.index_at_page', () => {
    const posts = [factoryPost.data]
    it('投稿一覧の1ページ目を取得できる', () => {
      expect.assertions(1)
      mockAxios.onGet('/posts?page=1').reply(200, posts)
      return post.index_at_page('\?page=1').then(res => {
        expect(res.data).toEqual(posts)
      })
    })
  })
})
