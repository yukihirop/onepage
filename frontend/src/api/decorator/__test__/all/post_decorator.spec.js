import PostDecorator from '@/api/decorator/all/post_decorator'
import factoryPost from '@/api/__test__/factories/all/posts'

describe('PostDecorator', () => {
  var postDecorator = new PostDecorator(factoryPost.data[0])

  describe('.who()', () => {
    const expected = factoryPost.data[0].attributes.user.mention_name
    const actual = postDecorator.who()
    it('投稿者の名前が取得できること', () => {
      expect(actual).toEqual(expected)
    })
  })

  describe('.when()', () => {
    const expected = factoryPost.data[0].attributes.revision.created_at
    const actual = postDecorator.when()
    it('投稿された日時が取得できること', () => {
      expect(actual).toEqual(expected)
    })
  })

  describe('.likes()', () => {
    const expected = factoryPost.data[0].attributes["post-likings-count"]
    const actual = postDecorator.likes()
    it('投稿についた「いいね！」の数が取得できうること', () => {
      expect(actual).toEqual(expected)
    })
  })

  describe('.title()', () => {
    const expected = factoryPost.data[0].attributes.revision.title
    const actual = postDecorator.title()
    it('投稿のタイトルが取得できること', () => {
      expect(actual).toEqual(expected)
    })
  })

  describe('.organization()', () => {
    const expected = factoryPost.data[0].attributes.profile.organization
    const actual = postDecorator.organization()
    it('投稿者の会社名が取得できること', () => {
      expect(actual).toEqual(expected)
    })
  })

  describe('.summary()', () => {
    const expected = factoryPost.data[0].attributes.revision.summary
    const actual = postDecorator.summary()
    it('投稿の要約が取得できること', () => {
      expect(actual).toEqual(expected)
    })
  })
})