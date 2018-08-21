<template lang="pug">
.hero
  time-line-table-title
  chat-media(:profile-image-src='require("@/assets/home/user/yusabana.png")',
       who='Yuma Inaura', what='コメント', when='1 hour ago',
       comment='とっても聞いてみたいと思いました。',
       refTitle='コードレビューで気をつけていること',
       refComments=2)
  post-with-post-media(:profile-image-src='require("@/assets/home/user/gorilla.png")',
       who='gorilla', when='3 hours ago',
       title='rubyでLispの処理系を書いた話',
       organization = '株式会社Aiming',
       summary='Lispっていいですよね。何と言ってもインタプリタシンプルですよね。これrubyでも書けそうな気がしたんでかいてみました。少しでもLispに興味を盛ってくれる人が増えたら嬉しいなと思って作ってみました。')
  post-with-like-media(:profile-image-src='require("@/assets/home/user/YumaInaura.png")',
       who='gorilla', when='1 day ago',
       title='瞑想がプログラマに与える効果に関して',
       organization = '株式会社Aiming',
       summary = 'Googleも取り入れている瞑想。意外としらない瞑想の効果。そんな瞑想の効果を1年間自分でたってみた経験を踏まえ話して見たいともいます。この資料をみて瞑想を生活週間に取り入れてくれる人が増えたらいいな')
  chat-media(:profile-image-src='require("@/assets/home/user/neko_5.png")',
       who='panda', when='2 days ago',
       comment='資料の構成が非常に参考になりました。',
       refTitle='新人プログラマとペアプロしてわかったこと',
       refComments=72)
  post-with-post-media(:profile-image-src='require("@/assets/home/user/YumaInaura.png")',
       who='Yuma Inaura', when='1 week ago',
       title='瞑想がプログラマに与える効果に関して',
       organization = '株式会社Aiming',
       summary = 'Googleも取り入れている瞑想。意外としらない瞑想の効果。そんな瞑想の効果を1年間自分でたってみた経験を踏まえ話して見たいともいます。この資料をみて瞑想を生活週間に取り入れてくれる人が増えたらいいな')
</template>

<script>
import TimeLineTableTitle from '@/components/atoms/title/TimeLineTableTitle.vue'
import ChatMedia from '@/components/atoms/media_object/ChatMedia.vue'
import PostWithLikeMedia from '@/components/molecules/media_object/PostWithLikeMedia.vue'
import PostWithPostMedia from '@/components/molecules/media_object/PostWithPostMedia.vue'

export default {
  components: {
    TimeLineTableTitle,
    ChatMedia,
    PostWithLikeMedia,
    PostWithPostMedia
  }
}
</script>

<style scoped lang="stylus">
.panel-block
  display: flex
  flex-direction: row
  align-items: center
</style>