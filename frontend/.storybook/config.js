import { configure } from '@storybook/vue'
import { setOptions } from "@storybook/addon-options";

setOptions({
  name: "OnePage",
  url: "https://github.com/yukihirop/onepage",
  goFullScreen: false,
  showStoriesPanel: true,
  showAddonPanel: true,
  showSearchBox: false,
  addonPanelInRight: false,
  sortStoriesByKind: true,
});

const loadStories = () => {
  // 参考
  // https://storybook.js.org/basics/writing-stories/#loading-stories-dynamically
  // https://github.com/carbon-design-system/carbon-components-react/blob/master/.storybook/config.js
  const req = require.context('../src/stories', true, /\.js$/)
  req.keys().forEach(filename => req(filename))
}

configure(loadStories, module)
