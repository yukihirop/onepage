import User from './model/user'
import CurrentUserPost from '@/api/model/current_user/post'
import CurrentUserRevision from '@/api/model/current_user/revision'
import SettingProfile from './model/setting/profile'
import PostLike from './model/post/like'
import UserLike from './model/user/like'
import * as currentUserEndpoints from '@/api/endpoints/current_user/index'
import * as endpoints from '@/api/endpoints/index'

export const user = new User(endpoints.user)
export const currentUserPost = new CurrentUserPost(currentUserEndpoints.post)
export const currentUserRevision = new CurrentUserRevision(currentUserEndpoints.revision)
export const settingProfile = new SettingProfile(endpoints.setting.profile)
export const postLike = new PostLike(endpoints.post.like)
export const userLike = new UserLike(endpoints.user.like)
