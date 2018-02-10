import { configure } from '@storybook/vue'

const loadStories = () => {
  // 参考
  // https://github.com/carbon-design-system/carbon-components-react/blob/master/.storybook/config.js
  const req = require.context('../src/stories', true, /\.js$/)
  req.keys().forEach(filename => req(filename))
}

configure(loadStories, module)