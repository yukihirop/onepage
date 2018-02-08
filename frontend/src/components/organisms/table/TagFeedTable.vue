<template lang="pug">
.hero
  .panel-block
    .tagfeed-table-header
      .panel-icon
        i.fa.fa-tags.fa-2x.tags
      .title.is-6 タグ・フィード
  post-with-tag-media(:profile-image-src='require("../../../assets/home/user/aimerald.png")',
       :tag-image-src='require("../../../assets/home/tag/Ruby.jpg")',
       tag='Ruby', when='15 minutes ago',
       title='rubyでLispの処理系を書いた話',
       organization='株式会社Aiming',
       summary='Lispっていいですよね。何と言ってもインタプリタシンプルですよね。これrubyでも書けそうな気がしたんでかいてみました。少しでもLispに興味を盛ってくれる人が増えたら嬉しいなと思って作ってみました。')
  post-with-tag-media(:profile-image-src='require("../../../assets/home/user/YumaInaura.png")',
       :tag-image-src='require("../../../assets/home/tag/Rails.jpg")',
       tag='Rails', when='1 hours ago',
       title='瞑想がプログラマに与える効果に関して',
       organization='株式会社Aiming',
       summary='Googleも取り入れている瞑想意外と知らない瞑想の効果そんな瞑想の効果を1年間自分でやってみた経験を踏まえ話してみたいと思います。この資料をみて瞑想を生活習慣に取り入れてくれる人が増えたらいいな')
  post-with-tag-media(:profile-image-src='require("../../../assets/home/user/KojiMiyake.png")',
       :tag-image-src='require("../../../assets/home/tag/PHP.jpg")',
       tag='PHP', when='2 hours ago',
       title='PHPを学び現場に入るまで',
       organization='株式会社リクルートマーケティングパートナーズ',
       summary='現在、PHPを学ぶためにはPHPチュートリアルをこなしたり書籍などを利用すると思われる。しかし実際の現場で開発すると、アプリケーションの構成やPHPの罠に戸惑う事がある。本発表ではPHP初学者が現場で開発する時に感じるであろうギャップをいくつか紹介する。')
  post-with-tag-media(:profile-image-src='require("../../../assets/home/user/yuemori.png")',
       :tag-image-src='require("../../../assets/home/tag/Docker.png")',
       tag='Docker', when='1 week ago',
       title='Rails on Dockerとの戦い',
       organization='株式会社Aiming',
       summary='Docker使っていますか？Rails on Dockerの事例は増えつつありますが、導入方法や構成について語られる事が多く、苦しみやすい・難しい点について語られることはあまりないように思います。今回はRuby/RailsでDockerを使ってきて戦った点とその解決方法について話します。')
  post-with-tag-media(:profile-image-src='require("../../../assets/home/user/skuroki.jpg")',
       :tag-image-src='require("../../../assets/home/tag/JavaScript.jpg")',
       tag='JavaScript', when='1 months ago',
       title='新人プログラマとペアプロしてわかったこと',
       organization='株式会社Aiming',
       summary='毎年、新しいメンバーが参画し、ペアプロで指導しています。今まで色んな人とペアプロしてきてわかったことがありま  す。その中でコツというかわかった事があったので資料にしてみました。背景知識がない人に以下に教えるか？相手の性格に焦点を当てて語りたいと思います。')
  post-with-tag-media(:profile-image-src='require("../../../assets/home/user/yukihirop.jpg")',
       tagImageSrc='https://bulma.io/images/placeholders/64x64.png',
       tag='WEB', when='1 months ago',
       title='OnePageというWEBサービスを作った話',
       organization='株式会社Aiming',
       summary='OnePageとは一言でいれば、プログラマのためのプレゼン資料共有ツールです。完成したプレゼンの資料を共有するのではなく、計画書(ブレスト)を共有し互いにレビューすることで構造的プレゼン資料を作成できるように習慣づけるサービスです。')
</template>

<script>
import PostWithTagMedia from '../../molecules/media_object/PostWIthTagMedia.vue'

export default {
  components: {
    PostWithTagMedia
  }
}
</script>

<style scoped lang="stylus">
$theme_color = #0081C1

.panel-block
  display: flex
  flex-direction: row
  align-items: center
  background-color: $theme_color

  .tagfeed-table-header
    display: flex
    flex-direction: row
    align-items: center
    width: 150px

    .tags
      color: white

    .title
      color: white
</style>