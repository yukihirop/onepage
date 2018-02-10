/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import PostMedia         from '@/components/molecules/media_object/PostMedia.vue'
import PostWithLikeMedia from '@/components/molecules/media_object/PostWithLikeMedia.vue'
import PostWithTagMedia  from '@/components/molecules/media_object/PostWithTagMedia.vue'

require('@/assets/css/mybulma.scss')

storiesOf('molecules/MediaObject', module)
  .add('PostMedia', () => ({
    components: { PostMedia },
    template: `<post-media
                  :profile-image-src="'https://bulma.io/images/placeholders/32x32.png'"
                  who='Koji Miyake'
                  when='2 months ago'
                  likes=278
                  title='Railsを学び現場に入るまで'
                  organization='株式会社リクルートマーケティングパートナーズ'
                  summary='現在、Railsを学ぶためにはRailsチュートリアルをこなしたり書籍などを利用すると思われる。しかし実際の現場で開発すると、アプリケーションの構成やRailsの罠に戸惑う事がある。本発表ではRails初学者が現場で開発する時に感じるであろうギャップをいくつか紹介する。'
               />`
  }))
  .add('PostWithLikeMedia', () => ({
    components: { PostWithLikeMedia },
    template: `<post-with-like-media
                  :profile-image-src="'https://bulma.io/images/placeholders/32x32.png'"
                  who='aimerald'
                  when='1 day ago'
                  title='瞑想がプログラマに与える効果に関して'
                  organization='株式会社Aiming'
                  summary='Googleも取り入れている瞑想。意外としらない瞑想の効果。そんな瞑想の効果を1年間自分でたってみた経験を踏まえ話して見たいともいます。この資料をみて瞑想を生活週間に取り入れてくれる人が増えたらいいな'
               />`
  }))
  .add('PostWithPostMedia', () => ({
    components: { PostWithPostMedia },
    template: `<post-with-post-media
                  :profile-image-src="'https://bulma.io/images/placeholders/32x32.png'"
                  who='Yuma Inaura'
                  when='1 day ago'
                  title='瞑想がプログラマに与える効果に関して'
                  organization='株式会社Aiming'
                  summary='Googleも取り入れている瞑想。意外としらない瞑想の効果。そんな瞑想の効果を1年間自分でたってみた経験を踏まえ話して見たいともいます。この資料をみて瞑想を生活週間に取り入れてくれる人が増えたらいいな'
               />`
  }))
  .add('PostWithTagMedia', () => ({
    components: { PostWithTagMedia },
    template: `<post-with-tag-media
                  :tag-image-src="'https://bulma.io/images/placeholders/32x32.png'"
                  tag='JavaScript'
                  when='1 months ago'
                  title='新人プログラマとペアプロしてわかったこと'
                  organization='株式会社Aiming'
                  summary='毎年、新しいメンバーが参画し、ペアプロで指導しています。今まで色んな人とペアプロしてきてわかったことがあります。その中でコツというかわかった事があったので資料にしてみました。背景知識がない人に以下に教えるか？相手の性格に焦点を当てて語りたいと思います。'
               />`
  }))
