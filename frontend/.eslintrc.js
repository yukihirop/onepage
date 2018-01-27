// https://eslint.org/docs/user-guide/configuring

module.exports = {
    extends: "standard",
    parser: 'babel-eslint',
    env: {
      browser: true,
      node: true
    },
    globals: {
      jest: false,
      expect: false,
      describe: false,
      it: false,
      beforeEach: false
    },
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
