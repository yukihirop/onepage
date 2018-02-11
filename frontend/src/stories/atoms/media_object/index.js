/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import VueInfoAddon  from 'storybook-addon-vue-info'

import ChatMedia             from '@/components/atoms/media_object/ChatMedia.vue'
import NotificationChatMedia from '@/components/atoms/media_object/NotificationChatMedia.vue'
import NotificationEditMedia from '@/components/atoms/media_object/NotificationEditMedia.vue'
import PostContentMedia      from '@/components/atoms/media_object/PostContentMedia.vue'
import PostMedia             from '@/components/atoms/media_object/PostMedia.vue'
import RecommendUserMedia    from '@/components/atoms/media_object/RecommendUserMedia.vue'
import TagMedia              from '@/components/atoms/media_object/TagMedia.vue'
import UserMedia             from '@/components/atoms/media_object/UserMedia.vue'

require('@/assets/css/mybulma.scss')

storiesOf('atoms/MediaObject', module)
  .addDecorator(VueInfoAddon)
  .add('ChatMedia', () => ({
    components: { ChatMedia },
    template: `<chat-media
                  :profile-image-src="'https://bulma.io/images/placeholders/32x32.png'"
                  who='Yuma Inaura' what='コメント'
                  when='1 hour ago'
                  comment='とっても聞いてみたいと思いました。'
                  refTitle='コードレビューで気をつけていること'
                  refComments=2
               />`
  }))
  .add('NotificationChatMedia', () => ({
    components: { NotificationChatMedia },
    template: `<notification-chat-media
                  :profile-image-src="'https://bulma.io/images/placeholders/32x32.png'"
                  who='aimerald'
                  postTitle='OnePageというWEB...'
                  when='2019/12/31 17:50'
               />`
  }))
  .add('NotificationEditMedia', () => ({
    components: { NotificationEditMedia },
    template: `<notification-edit-media
                  :profile-image-src="'https://bulma.io/images/placeholders/32x32.png'"
                  who='yukihirop'
                  postTitle='OnePageというWEB...'
                  when='2019/12/31 17:50'
               />`
  }))
  .add('PostContentMedia', () => ({
    components: { PostContentMedia },
    template: `<post-content-media
                  title='rubyでLispの処理系を書いた話'
                  organization = '株式会社Aiming'
                  summary='Lispっていいですよね。何と言ってもインタプリタシンプルですよね。これrubyでも書けそうな気がしたんでかいてみました。少しでもLispに興味を盛ってくれる人が増えたら嬉しいなと思って作ってみました。'
               />`
  }))
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
  .add('RecommendUserMedia', () => ({
    components: { RecommendUserMedia },
    template: `<recommend-user-media
                  :profile-image-src="'https://bulma.io/images/placeholders/32x32.png'"
                  username='まつもと　ゆきひろ'
                  mentionname='yukihiro_matz'
                  introduction='Rubyのパパ'
               />`
  }))
  .add('TagMedia', () => ({
    components: { TagMedia },
    template: `<tag-media
                  rank=1
                  :tag-image-src="'https://bulma.io/images/placeholders/256x256.png'"
                  tagname='JavaScript'
                  posts=1
               />`
  }))
  .add('UserMedia', () => ({
    components: { UserMedia },
    template: `<user-media
                  rank=1
                  :profile-image-src="'https://bulma.io/images/placeholders/256x256.png'"
                  username='aimerald'
                  mentionname='aimerald'
                  likes=99999
               />`
  }))
