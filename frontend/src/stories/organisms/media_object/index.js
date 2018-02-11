/* eslint no-multi-spaces: 0 */
import { storiesOf } from '@storybook/vue'
import VueInfoAddon  from 'storybook-addon-vue-info'

import RecommendUserMedia from '@/components/organisms/media_object/RecommendUserMedia.vue'
import TagMedia           from '@/components/organisms/media_object/TagMedia.vue'
import UserMedia          from '@/components/organisms/media_object/UserMedia.vue'

require('@/assets/css/mybulma.scss')

storiesOf('organisms/MediaObject', module)
  .addDecorator(VueInfoAddon)
  .add('RecommendUserMedia', () => ({
    components: { RecommendUserMedia },
    template: `<recommend-user-media />`
  }))
  .add('TagMedia', () => ({
    components: { TagMedia },
    template: `<tag-media />`
  }))
  .add('UserMedia', () => ({
    components: { UserMedia },
    template: `<user-media />`
  }))
