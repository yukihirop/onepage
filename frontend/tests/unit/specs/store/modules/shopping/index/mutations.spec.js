import store from '@/store/modules/shopping/index'

let state = store.state

describe('shopping - mutations', () => {
  describe('ADD_TO_CART', () => {
    const mockedState = {
      added: [
        { id: 'a', quantity: 10 },
        { id: 'b', quantity: 20 }
      ],
      all: [
        { id: 'a', name: '', description: '', price: 0 },
        { id: 'b', name: '', description: '', price: 0 },
        { id: 'c', name: '', description: '', price: 0 }
      ]
    }

    beforeEach(() => {
      state = store.state
    })

    it('カートに商品が無い時', () => {
      state = mockedState
      const targetId = 'c'
      store.mutations.ADD_TO_CART(state, { id: targetId})
      const received = state.added.length
      const expected = 3
      // expect { subject }.toChange(state.added.length).from(2).to(3)
      // みたいに書けないのかな？
      expect(received).toEqual(expected)
    })

    it('カートに商品が既にある場合', () => {
      state = mockedState
      const targetId = 'a'
      store.mutations.ADD_TO_CART(state, { id: targetId})
      const received = state.added[0]['quantity']
      const expected = 11
      expect(received).toEqual(expected)
    })
  })
})
