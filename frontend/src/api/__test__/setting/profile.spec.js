import MockAdapter from 'axios-mock-adapter'
import client from '../../client'
import SettingProfile from '../../model/setting/profile'
import * as endpoints from '@/api/endpoints/index'
import factorySetting from '../factories/setting/profiles'
import '../../../../env-config'

var faker = require('faker')
faker.locale = 'ja'

const mockAxios = new MockAdapter(client)
const profile = new SettingProfile(endpoints.setting.profile)

const { profile1 } = factorySetting.Profile.profile1

describe('SettingProfile', () => {
  describe('.show', () => {
    describe('onFulFilled', () => {
      it('idで指定された投稿(内容あり)を取得できる', () => {
        expect.assertions(1)
        mockAxios.onGet('/settings/profile').reply(200, profile1)
        return profile.show().then(res => {
          expect(res.data).toEqual(profile1)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        mockAxios.onGet('/settings/profile').reply(404)
        return profile.show().catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
  })

  describe('.update', () => {
    describe('onFulFilled', () => {
      it('投稿のtitleが更新される', () => {
        expect.assertions(1)
        const updateParams = { name: 'update' }
        const updatedprofile = Object.assign(Object.assign({}, profile1), updateParams)
        mockAxios.onPut('/settings/profile').reply(200, updatedprofile)
        return profile.update(updateParams).then(res => {
          expect(res.data).toEqual(updatedprofile)
        })
      })
    })
    describe('onRejected', () => {
      it('Not Foundが返ってくる', () => {
        const updateParams = { title: 'update' }
        mockAxios.onPut('/settings/profile').reply(404)
        return profile.update(updateParams).catch(error => {
          expect(error.errors).toEqual(['Not Found'])
        })
      })
    })
    describe('onRejected', () => {
      it('Unprocessable Entityが返ってくる', () => {
        const updateParams = { title: 'update' }
        mockAxios.onPut('/settings/profile').reply(422)
        return profile.update(updateParams).catch(error => {
          expect(error.errors).toEqual(['Unprocessable Entity'])
        })
      })
    })
  })
})
