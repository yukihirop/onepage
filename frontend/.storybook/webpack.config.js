const path = require('path')

/*
https://github.com/storybooks/storybook/issues/2836

    defaultConfig.module.rules.push(
               ^

TypeError: Cannot read property 'module' of undefined
*/
const genDefaultConfig = require('@storybook/vue/dist/server/config/defaults/webpack.config.js');

module.exports = (baseConfig, env) => {
  const defaultConfig = genDefaultConfig(baseConfig, env);

  defaultConfig.module.rules.push(
      {
        test: /\.scss$/,
        use: [
          'vue-style-loader',
          'css-loader',
          'sass-loader'
        ],
      },
      {
        test: /\.sass$/,
        use: [
          'vue-style-loader',
          'css-loader',
          'sass-loader?indentedSyntax'
        ],
      },
      {
        test: /\.pug$/,
        loader: 'pug-loader'
      }
  );

  // https://github.com/storybooks/storybook/issues/44
  Object.assign(defaultConfig.resolve || {}, {
      alias:
      {
        'vue$': path.resolve(__dirname, '../node_modules/vue/dist/vue.esm.js'),
        '@': path.resolve(__dirname, '../src')
      }
    });

  // Return the altered config
  return defaultConfig;
};