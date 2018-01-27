import store from '@/store/modules/shopping/index'

let state = store.state

describe('shoppping - getters', () => {

  it('allProducts', () => {
    const result = store.getters.allProducts(state)
    expect(result).toEqual(state.all)
  })

  describe('getNumberOfProducts', () => {

    beforeEach(() => {
      state = store.state
    })

    // itはcontextみたいな奴があったらそれに置き換えたい
    it('購入可能な商品が無い時', () => {
      const mockedState = {
        added: [],
        all: []
      }
      state = mockedState
      const received = store.getters.getNumberOfProducts(state)
      const expected = 0
      expect(received).toEqual(expected)
    })

    it('購入可能な商品がある時', () => {
      const received = store.getters.getNumberOfProducts(state)
      const expected = 3
      expect(received).toEqual(expected)
    })
  })

  describe('cartProducts', () => {

    beforeEach(() => {
      state = store.state
    })

    it('カートに商品が無い時', () => {
      const result = store.getters.cartProducts(state)
      expect(result).toEqual([])
    })

    it('カートに購入商品がある時', () => {
      const mockedState = {
        added: [
          { id: 'a', quantity: 10 },
          { id: 'b', quantity: 20 },
        ],
        all: [
          { id: 'a', name: '', description: '', price: 0 },
          { id: 'b', name: '', description: '', price: 0 },
          { id: 'c', name: '', description: '', price: 0 },
        ]
      }
      state = mockedState
      const received = store.getters.cartProducts(state)
      const expected = [
        {"name": "", "price": 0, "quantity": 10},
        {"name": "", "price": 0, "quantity": 20}
      ]
      expect(received).toEqual(expected)
    })
  })
})
