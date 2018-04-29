<template lang="pug">
.hero
  trend-table-title
  span(v-for='(post, index) in posts')
    post-media(:profile-image-src='profileImageSrcs[index]',
               :who="post.who",
               :when="post.when",
               :likes="post.likes",
               :title="post.title",
               :organization="post.organization",
               :summary="post.summary"
               )
  br
  pagination(:page-count="headers['page-count']", :click-hander="fetchPosts")
</template>

<script>
import TrendTableTitle from '@/components/atoms/title/TrendTableTitle.vue'
import PostMedia from '@/components/atoms/media_object/PostMedia.vue'
import Pagination from '@/components/atoms/pagination/Pagination.vue'
import { post } from '@/api/index'
import PostDecorator from '@/api/decorator/all/post_decorator'

export default {
  components: {
    TrendTableTitle,
    PostMedia,
    Pagination
  },
  data() {
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
      var params = typeof pageNum !== 'undefined' ? '\?page=' + pageNum : null
      post.index_at_page(params).then(response => {
        this.parseResponseHeaders(response)
        this.parseResponseData(response)
      }).catch(error => {
        console.error(error)
      })
    },
    parseResponseData(response){
      response.data["data"].forEach( post => {
        var postDecorator = new PostDecorator(post)
        var result = {
          who: postDecorator.who(),
          when: postDecorator.when(),
          likes: postDecorator.likes(),
          title: postDecorator.title(),
          organization: postDecorator.organization(),
          summary: postDecorator.summary()
        }
        this.posts.push(result)
      })
    },
    parseResponseHeaders(response){
      var headers = response.headers
      this.headers['page-count'] = headers['x-total-pages']
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
