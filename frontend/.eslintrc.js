// https://eslint.org/docs/user-guide/configuring
// rules一覧を確認するなら
// https://garafu.blogspot.jp/2017/02/eslint-rules-jp.html

module.exports = {
    root: true,
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
    ],
    rules: {
      // アロー関数の引数部分には丸括弧を記述すること
      'arrow-parens': 0,
      // ジェネレータ関数を示す*の前には空白を入れ、後には空白をいれないこと
      'generator-star-spacing': 0,
      // デバッガを使用しないこと(developmentでは使用する)
      'no-debuger': process.env.NODE_ENV === 'production' ? 2 : 0,
      // Keyの横のスペースを許可する
      'key-spacing': 0
    }
};
