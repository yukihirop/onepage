import MockAdapter from 'axios-mock-adapter'
import client from '@/api/client'
import CurrentUserSettingProfile from '@/api/model/current_user/setting/profile'
import * as currentUserEndpoints from '@/api/endpoints/current_user/index'
import factorySetting from '@/api/__test__/factories/setting/profiles'

const mockAxios = new MockAdapter(client)
const currentUserProfile = new CurrentUserSettingProfile(currentUserEndpoints.setting.profile)

const { profile1 } = factorySetting.Profile.profile1

describe('CurrentUserSettingProfile', () => {
  describe('.show', () => {
    describe('onFulFilled', () => {
      it('カレントユーザーのidで指定された投稿(内容あり)を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/current_user/settings/profile').reply(200, profile1)
        return currentUserProfile.show().then(res => {
          expect(res.data).toEqual(profile1)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        mockAxios.onGet('/current_user/settings/profile').reply(404)
        return currentUserProfile.show().catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
  })

  describe('.update', () => {
    describe('onFulFilled', () => {
      it('カレントユーザーの投稿のtitleが更新される', () => {
        expect.assertions(1)
        const updateParams = { name: 'update' }
        const updatedprofile = Object.assign(Object.assign({}, profile1), updateParams)
        mockAxios.onPut('/current_user/settings/profile').reply(200, updatedprofile)
        return currentUserProfile.update(updateParams).then(res => {
          expect(res.data).toEqual(updatedprofile)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        const updateParams = { title: 'update' }
        mockAxios.onPut('/current_user/settings/profile').reply(404)
        return currentUserProfile.update(updateParams).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        const updateParams = { title: 'update' }
        mockAxios.onPut('/current_user/settings/profile').reply(422)
        return currentUserProfile.update(updateParams).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })
})
