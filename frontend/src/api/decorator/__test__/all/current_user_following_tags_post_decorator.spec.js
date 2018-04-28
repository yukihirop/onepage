import CurrentUserFollowingTagsPostDecorator from '@/api/decorator/all/current_user_following_tags_post_decorator'
import factoryPost from '@/api/__test__/factories/all/current_user_following_tags_posts'

var moment = require('moment')

describe('CurrentUserFollowingTagsPostDecorator', () => {
  var postDecorator = new CurrentUserFollowingTagsPostDecorator(factoryPost.data[0])

  describe('.tag()', () => {
    const expected = factoryPost.data[0].attributes.tags[0].name
    const actual = postDecorator.tag()
    it('投稿についた最初のタグが習得できること', () => {
      expect(actual).toEqual(expected)
    })
  })

  describe('.when()', () => {
    const created_at = factoryPost.data[0].attributes.revision.created_at
    const expected = moment(created_at).fromNow()
    const actual = postDecorator.when()
    it('投稿された日時が取得できること', () => {
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
