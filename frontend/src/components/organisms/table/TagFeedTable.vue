<template lang="pug">
.hero
  tag-feed-table-title
  span(v-for='(post, index) in posts')
    post-with-tag-media(:profile-image-src='profileImageSrcs[index]',
                        :tag-image-src='tagImageSrcs[index]',
                        :tag=''
    )
  post-with-tag-media(:profile-image-src='require("@/assets/home/user/aimerald.png")',
       :tag-image-src='require("@/assets/home/tag/Ruby.jpg")',
       tag='Ruby', when='15 minutes ago',
       title='rubyでLispの処理系を書いた話',
       organization='株式会社Aiming',
       summary='Lispっていいですよね。何と言ってもインタプリタシンプルですよね。これrubyでも書けそうな気がしたんでかいてみました。少しでもLispに興味を盛ってくれる人が増えたら嬉しいなと思って作ってみました。')
  post-with-tag-media(:profile-image-src='require("@/assets/home/user/YumaInaura.png")',
       :tag-image-src='require("@/assets/home/tag/Rails.jpg")',
       tag='Rails', when='1 hours ago',
       title='瞑想がプログラマに与える効果に関して',
       organization='株式会社Aiming',
       summary='Googleも取り入れている瞑想意外と知らない瞑想の効果そんな瞑想の効果を1年間自分でやってみた経験を踏まえ話してみたいと思います。この資料をみて瞑想を生活習慣に取り入れてくれる人が増えたらいいな')
  post-with-tag-media(:profile-image-src='require("@/assets/home/user/KojiMiyake.png")',
       :tag-image-src='require("@/assets/home/tag/PHP.jpg")',
       tag='PHP', when='2 hours ago',
       title='PHPを学び現場に入るまで',
       organization='株式会社リクルートマーケティングパートナーズ',
       summary='現在、PHPを学ぶためにはPHPチュートリアルをこなしたり書籍などを利用すると思われる。しかし実際の現場で開発すると、アプリケーションの構成やPHPの罠に戸惑う事がある。本発表ではPHP初学者が現場で開発する時に感じるであろうギャップをいくつか紹介する。')
  post-with-tag-media(:profile-image-src='require("@/assets/home/user/yuemori.png")',
       :tag-image-src='require("@/assets/home/tag/Docker.png")',
       tag='Docker', when='1 week ago',
       title='Rails on Dockerとの戦い',
       organization='株式会社Aiming',
       summary='Docker使っていますか？Rails on Dockerの事例は増えつつありますが、導入方法や構成について語られる事が多く、苦しみやすい・難しい点について語られることはあまりないように思います。今回はRuby/RailsでDockerを使ってきて戦った点とその解決方法について話します。')
  post-with-tag-media(:profile-image-src='require("@/assets/home/user/skuroki.jpg")',
       :tag-image-src='require("@/assets/home/tag/JavaScript.jpg")',
       tag='JavaScript', when='1 months ago',
       title='新人プログラマとペアプロしてわかったこと',
       organization='株式会社Aiming',
       summary='毎年、新しいメンバーが参画し、ペアプロで指導しています。今まで色んな人とペアプロしてきてわかったことがありま  す。その中でコツというかわかった事があったので資料にしてみました。背景知識がない人に以下に教えるか？相手の性格に焦点を当てて語りたいと思います。')
  post-with-tag-media(:profile-image-src='require("@/assets/home/user/yukihirop.jpg")',
       tagImageSrc='https://bulma.io/images/placeholders/64x64.png',
       tag='WEB', when='1 months ago',
       title='OnePageというWEBサービスを作った話',
       organization='株式会社Aiming',
       summary='OnePageとは一言でいれば、プログラマのためのプレゼン資料共有ツールです。完成したプレゼンの資料を共有するのではなく、計画書(ブレスト)を共有し互いにレビューすることで構造的プレゼン資料を作成できるように習慣づけるサービスです。')
</template>

<script>
import TagFeedTableTitle from '@/components/atoms/title/TagFeedTableTitle.vue'
import PostWithTagMedia from '@/components/molecules/media_object/PostWithTagMedia.vue'

export default {
  components: {
    PostWithTagMedia,
    TagFeedTableTitle
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
      tagImageSrcs: [
        require("@/assets/home/tag/Ruby.jpg"),
        require("@/assets/home/tag/Rails.jpg"),
        require("@/assets/home/tag/PHP.jpg"),
        require("@/assets/home/tag/Docker.png"),
        require("@/assets/home/tag/JavaScript.jpg"),
        'https://bulma.io/images/placeholders/64x64.png'
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
      var customize_params = params !== null ? params + '&\?current_user_tag=true' : '\?current_user_tag=true'
      post.index_at_page(customize_params).then(response => {
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