// https://eslint.org/docs/user-guide/configuring

module.exports = {
    extends: "standard",
    parserOptions: {
      sourceType: 'module',
      ecmaFeatures: {
        impliedStrict: true
      }
    },
    plugins: [
      'html'
    ]
};
