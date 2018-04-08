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
})
