import { showToast } from "vant"
import { USER_LOGIN, INIT_USER,LOGIN_OUT } from "./mutations-types"
export default {
    state: {

        // 登录状态
        loginStatus: false,
        // token
        token: null,
        // 用户信息：用户的头像
        userInfo: {}
    },
    getters: {

    },
    mutations: {
        // 存储用户信息
        [USER_LOGIN](state, user) {
            state.loginStatus = true
            state.token = user
            state.userInfo = user

            // 持久化存储=》本地存储
            localStorage.setItem('token', JSON.stringify(user))
        },
        // 读取存储数据
        [INIT_USER](state) {
            let userInfo = JSON.parse(localStorage.getItem('token'))
            // let userInfo = jwtDecode(info)
            if (userInfo) {
                state.loginStatus = true
                state.userInfo = userInfo
            }
        },
        // 退出登录状态
        [LOGIN_OUT](state){
            state.loginStatus = false;
            state.token = null;
            state.userInfo = {};
            localStorage.removeItem('token')
            showToast({
                message: '退出',
                forbidClick: true,
                duration: 1000,
              })
        }
    },
    actions: {

    }
}