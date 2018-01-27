// 公式ドキュメント: https://vuex.vuejs.org/ja/testing.html
// を参考に作成

// 期待されるミューテションをアクションが呼び出すか
// テストするためのヘルパー
export const testAction = (action, payload, state, expectedMutations, done) => {
  let count = 0

  // コミットをモックする
  const commit = (type, payload) => {
    const mutation = expectedMutations[count]

    try {
      expect(mutation.type).toEqual(type)
      if (payload) {
        expect(mutation.payload).toEqual(payload)
      }
    } catch (error) {
      done(error)
    }

    count++
    if (count >= expectedMutations.length) {
      done()
    }
  }

  // モック化したストアと引数でアクションを呼び出す
  action({ commit, state }, payload)

  // 呼び出されるべきミューテーションが残っていないか確認する
  if (expectedMutations.length === 0) {
    expect(count).toEqual(0)
    done()
  }
}