import store from '@/store/modules/shopping/index'
import { testAction } from '@specs/helper/test-actions.js'

let actions = store.actions

describe('shopping - actions', () => {
  it('addToCart', (done) => {
    const action = actions.addToCart
    const payload = { id: 'a' }
    const state = {}
    const expectedMutations = [{ type: 'ADD_TO_CART', payload: { id: 'a' } }]
    testAction(action, payload, state, expectedMutations, done)
  })
})