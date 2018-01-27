// https://eslint.org/docs/user-guide/configuring

module.exports = {
    extends: "standard",
    parser: 'babel-eslint',
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
