<template lang="pug">
.hero
  .panel-block
    .post-header
      .panel-icon
        i.fa.fa-bar-chart.fa-2x.trend
      .title.is-6 トレンド
    .post-header-sub
      .title.is-7 ここ数時間で人気を集めている記事
  post(:profile-image-src='require("../../../assets/home/user/yukihirop.jpg")',
       who='yukihirop', when='3 hours ago', likes=278,
       title='OnePageというWEBサービスを作った話',
       organization='株式会社Aiming',
       summary='OnePageとは一言でいれば、プログラマのためのプレゼン資料共有ツールです。完成したプレゼンの資料を共有するのではなく、計画書(ブレスト)を共有し互いにレビューすることで構造的プレゼン資料を作成できるように習慣づけるサービスです。')
  post(:profile-image-src='require("../../../assets/home/user/aimerald.png")',
       who='aimerald', when='3 hours ago', likes=278,
       title='rubyでLispの処理系を書いた話',
       organization='株式会社Aiming',
       summary='Lispっていいですよね。何と言ってもインタプリタシンプルですよね。これrubyでも書けそうな気がしたんでかいてみました。少しでもLispに興味を盛ってくれる人が増えたら嬉しいなと思って作ってみました。')
  post(:profile-image-src='require("../../../assets/home/user/YumaInaura.png")',
       who='Yuma Inaura', when='1 day ago', likes=278,
       title='瞑想がプログラマに与える効果に関して',
       organization='株式会社Aiming',
       summary='Googleも取り入れている瞑想意外と知らない瞑想の効果そんな瞑想の効果を1年間自分でやってみた経験を踏まえ話してみたいと思います。この資料をみて瞑想を生活習慣に取り入れてくれる人が増えたらいいな')
  post(:profile-image-src='require("../../../assets/home/user/skuroki.jpg")',
       who='skuroki', when='2 days ago', likes=278,
       title='新人プログラマとペアプロしてわかったこと',
       organization='株式会社Aiming',
       summary='毎年、新しいメンバーが参画し、ペアプロで指導しています。今まで色んな人とペアプロしてきてわかったことがあります。その中でコツというかわかった事があったので資料にしてみました。背景知識がない人に以下に教えるか？相手の性格に焦点を当てて語りたいと思います。')
  post(:profile-image-src='require("../../../assets/home/user/yuemori.png")',
       who='yuemori', when='1 week ago', likes=278,
       title='Rails on Dockerとの戦い',
       organization='株式会社Aiming',
       summary='Docker使っていますか？Rails on Dockerの事例は増えつつありますが、導入方法や構成について語られる事が多く、苦しみやすい・難しい点について語られることはあまりないように思います。今回はRuby/RailsでDockerを使ってきて戦った点とその解決方法について話します。')
  post(:profile-image-src='require("../../../assets/home/user/KojiMiyake.png")',
       who='Koji Miyake', when='2 months ago', likes=278,
       title='Railsを学び現場に入るまで',
       organization='株式会社リクルートマーケティングパートナーズ',
       summary='現在、Railsを学ぶためにはRailsチュートリアルをこなしたり書籍などを利用すると思われる。しかし実際の現場で開発すると、アプリケーションの構成やRailsの罠に戸惑う事がある。本発表ではRails初学者が現場で開発する時に感じるであろうギャップをいくつか紹介する。')
</template>

<script>
import Post from './partial/maintable/Post.vue'

export default {
  components:{
    Post
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

  .post-header
    display: flex
    flex-direction: row
    align-items: center
    width: 150px

    .trend
      color: white

    .title
      color: white

  .post-header-sub
    .title
      color: white
      padding-left: 1.0em
</style>