<template lang="pug">
.hero
  time-line-table-title
  span(v-for="(post, index) in posts")
    span(v-if="post.actionType === 'post'")
      post-with-post-media(:profile-image-src="profileImageSrcs[index]",
                           :who="post.who",
                           :when="post.when",
                           :title="post.title",
                           :organization="post.organization",
                           :summary="post.summary"
                          )
    span(v-if-else="post.actionType === 'post_liking'")
      post-with-like-media(:profile-image-src="profileImageSrcs[index]",
                           :who="post.who",
                           :when="post.when",
                           :title="post.title",
                           :organization="post.organization",
                           :summary="post.summary"
                          )
    span(v-if-else="post.actionType === 'comment'")
      chat-media(:profile-image-src="profileImageSrcs[index]",
                 :who="post.who",
                 :when="post.when",
                 :comment="post.comment"
                 :refTitle="post.refTitle",
                 :refComments="post.refComments"
                )
  br
  pagination(:page-count="headers['page-count']", :click-hander="fetchPosts")
</template>

<script>
import TimeLineTableTitle from '@/components/atoms/title/TimeLineTableTitle.vue'
import ChatMedia from '@/components/atoms/media_object/ChatMedia.vue'
import PostWithLikeMedia from '@/components/molecules/media_object/PostWithLikeMedia.vue'
import PostWithPostMedia from '@/components/molecules/media_object/PostWithPostMedia.vue'
import CurrentUserFollowingUsersPostDecorator from '@/api/decorator/all/current_user_following_users_post_decorator'
import CurrentUserFollowingUsersCommentPostDecorator    from '@/api/decorator/all/current_user_following_users/comment_post_decorator'
import { post } from '@/api/index'
import Pagination from '@/components/atoms/pagination/Pagination.vue'

export default {
  components: {
    TimeLineTableTitle,
    ChatMedia,
    PostWithLikeMedia,
    PostWithPostMedia,
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
        var postDecorator = new CurrentUserFollowingUsersPostDecorator(post).build()
        this.posts.push(postDecorator.data())
      })
    },
    parseResponseHeaders(response){
      var headers = response.headers
      this.headers['page-count'] = headers['x-total-pages']
    },
    customize_params(pageNum){
      var params = typeof pageNum !== 'undefined' ? '\?page=' + pageNum : null
      var customize_params = params !== null ? params + '&current_user_following_users=true' : '\?current_user_following_users=true'
      return customize_params
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