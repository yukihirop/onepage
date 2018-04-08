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
</template>

<script>
import TrendTableTitle from '@/components/atoms/title/TrendTableTitle.vue'
import PostMedia from '@/components/atoms/media_object/PostMedia.vue'
import { post } from '@/api/index'
import PostDecorator from '@/api/decorator/all/post_decorator'

export default {
  components: {
    TrendTableTitle,
    PostMedia
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
      posts: []
    }
  },
  mounted(){
    this.fetchPosts()
  },
  methods: {
    fetchPosts(){
      post.index().then(response => {
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
      }).catch(error => {
        console.error(error)
      })
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
