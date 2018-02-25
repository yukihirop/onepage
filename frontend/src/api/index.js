import User from './model/user'
import Post from './model/post'
import Revision from './model/revision'
import SettingProfile from './model/setting/profile'
import * as endpoints from './endpoints'

export const user = new User(endpoints.user)
export const post = new Post(endpoints.post)
export const revision = new Revision(endpoints.revision)
export const settingProfile = new SettingProfile(endpoints.setting.profile)
