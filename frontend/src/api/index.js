import User from '@/api/model/user'
import Tag from '@/api/model/tag'
import CurrentUserPost from '@/api/model/current_user/post'
import CurrentUserRevision from '@/api/model/current_user/revision'
import CurrentUserSettingProfile from '@/api/model/current_user/setting/profile'
import PostLike from '@/api/model/post/like'
import UserLike from '@/api/model/user/like'
import * as currentUserEndpoints from '@/api/endpoints/current_user/index'
import * as endpoints from '@/api/endpoints/index'

export const user = new User(endpoints.user)
export const tag = new Tag(endpoints.tag)
export const currentUserPost = new CurrentUserPost(currentUserEndpoints.post)
export const currentUserRevision = new CurrentUserRevision(currentUserEndpoints.revision)
export const currentUserSettingProfile = new CurrentUserSettingProfile(currentUserEndpoints.setting.profile)
export const postLike = new PostLike(endpoints.post.like)
export const userLike = new UserLike(endpoints.user.like)
