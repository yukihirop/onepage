<template lang="pug">
.hero
  tag-feed-table-title
  span(v-for='(post, index) in posts')
    post-with-tag-media(:profile-image-src='profileImageSrcs[index]',
                        :tag-image-src='tagImageSrcs[index]',
                        :tag="post.tag",
                        :when="post.when",
                        :title="post.title",
                        :organization="post.organization",
                        :summary="post.summary"
    )
  br
  pagination(:page-count="headers['page-count']", :click-hander="fetchPosts")
</template>

<script>
import TagFeedTableTitle from '@/components/atoms/title/TagFeedTableTitle.vue'
import PostWithTagMedia from '@/components/molecules/media_object/PostWithTagMedia.vue'
import Pagination from '@/components/atoms/pagination/Pagination.vue'
import { post } from '@/api/index'
import CurrentUserFollowingTagsPostDecorator from '@/api/decorator/all/current_user_following_tags_post_decorator'

export default {
  components: {
    PostWithTagMedia,
    TagFeedTableTitle,
    Pagination
  },
  data(){
    return {
      profileImageSrcs: [
        require("@/assets/home/user/aimerald.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/YumaInaura.png"),
        require("@/assets/home/user/yukihirop.jpg")
          ],
      tagImageSrcs: [],
      posts: [],
      headers: {}
    }
  },
  mounted(){
    this.fetchPosts()
  },
  methods: {
    fetchPosts(pageNum){
      this.headers = {}
      this.posts = []
      post.index_at_page(this.customize_params(pageNum)).then(response => {
        this.parseResponseHeaders(response)
        this.parseResponseData(response)
      }).catch(error => {
        console.error(error)
      })
    },
    parseResponseData(response){
      response.data["data"].forEach( post => {
        var postDecorator = new CurrentUserFollowingTagsPostDecorator(post)
        this.posts.push(postDecorator.data())
        this.createTagImageSrcs(postDecorator.data())
      })
    },
    parseResponseHeaders(response){
      var headers = response.headers
      this.headers['page-count'] = headers['x-total-pages']
    },
    customize_params(pageNum){
      var params = typeof pageNum !== 'undefined' ? '\?page=' + pageNum : null
      var customize_params = params !== null ? params + '&current_user_following_tags=true' : '\?current_user_following_tags=true'
      return customize_params
    },
    // ゆくゆくは、Amazon S3から画像を習得するようにしたい。
    createTagImageSrcs(post){
      var tagImageSrc = require("@/assets/home/tag/" + post.tag + ".jpg")
      this.tagImageSrcs.push(tagImageSrc)
    }
  }
}
</script>

<style scoped lang="stylus">
.panel-block
  display: flex
  flex-direction: row
  align-items: center
</style>