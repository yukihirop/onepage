import MockAdapter from 'axios-mock-adapter'
import client from '@/api/client'
import User from '@/api/model/all/user'
import * as endpoints from '@/api/endpoints/index'
import factoryUserParams from '@/api/__test__/factories/all/users'

const mockAxios = new MockAdapter(client)
const user = new User(endpoints.user)

const { user1 } = factoryUserParams.user1

describe('User', () => {
  describe('.index', () => {
    describe('onFulFilled', () => {
      const users = [factoryUserParams.user1, factoryUserParams.user2]
      it('全てのユーザーを取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/users').reply(200, users)
        return user.index().then(res => {
          expect(res.data).toEqual(users)
        })
      })
    })
  })

  describe('.show', () => {
    describe('onFulFilled', () => {
      it('idで指定されたユーザーを取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('users/1').reply(200, user1)
        return user.show({id: 1}).then(res => {
          expect(res.data).toEqual(user1)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        mockAxios.onGet('users/1').reply(404)
        return user.show({id: 1}).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
  })

  describe('.create', () => {
    describe('onFulFilled', () => {
      it('ユーザーを作成できる', () => {
        expect.assertions(1)
        const userParams = { id: 3, email: 'create@example.com' }
        const createdUser = { id: 3, email: 'create@example.com' }
        mockAxios.onPost('/users').reply(204, createdUser)
        return user.create(userParams).then(res => {
          expect(res.data).toEqual(createdUser)
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        const userParams = { id: 3, email: 'create@example.com' }
        mockAxios.onGet('/users').reply(422)
        return user.create(userParams).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })

  describe('.update', () => {
    describe('onFulFilled', () => {
      it('ユーザーのemailが更新される', () => {
        expect.assertions(1)
        const updateParams = { id: 1, email: 'update@example.com' }
        const updatedUser = { id: 1, email: 'update@example.com' }
        mockAxios.onPut('/users/1').reply(200, updatedUser)
        return user.update(updateParams).then(res => {
          expect(res.data).toEqual(updatedUser)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        const updateParams = { id: 1, email: 'update@example.com' }
        mockAxios.onPut('/users/1').reply(404)
        return user.update(updateParams).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        const updateParams = { id: 1, email: 'update@example.com' }
        mockAxios.onPut('/users/1').reply(422)
        return user.update(updateParams).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })

  describe('.destroy', () => {
    describe('onFulFilled', () => {
      it('ユーザーが削除される', () => {
        expect.assertions(1)
        mockAxios.onDelete('/users/1').reply(200, user1)
        return user.destroy({id: 1}).then(res => {
          expect(res.data).toEqual(user1)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        mockAxios.onDelete('/users/1').reply(404)
        return user.destroy({id: 1}).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        mockAxios.onDelete('/users/1').reply(422)
        return user.destroy({id: 1}).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })
})
