//对axios进行二次封装,将刚才下载好的axios导入进来
import axios from "axios";

import qs from 'qs'

import {showFailToast, showLoadingToast} from 'vant'
import router from '@/router'

axios.defaults.headers['Content-Type'] = 'application/x-www-form-urlencoded' //声明请求格式
 axios.defaults.transformRequest = data => qs.stringify(data)  //qs是第三方库，转换为x-www-form-urlencoded
 

//2. 利用axios对象的方法create,去创建一个axios实例
//requests就是axios,只不过稍微配置一下
const api = axios.create({
    //基础路径
    baseURL: 'http://localhost:3007', // 所有请求的公共地址部分
    timeout: 3000 // 请求超时时间,这里的意思是当请求时间超过5秒还未取得结果时,提示用户请求超时
})

// 获取本地token




// 请求拦截处理 请求拦截 在请求拦截中可以补充请求相关的配置
// interceptors axios的拦截器对象
api.interceptors.request.use(config => {
    showLoadingToast({
        message: "加载中...",
        forbidClick: true,
        loadingType: "spinner",
        duration:800
      });
      
      // config.headers.Accept="appliaction/json,text/plan";
      
 if(config.method === 'get'){
    config.data = qs.stringify(config.data);
   }
    // config 请求的所有信息
    // console.log(config);
    // 响应成功的返回
    // const token = localStorage.getItem('token')
    // if(token){
    // // 如果token存在，则将token添加到请求头中
    //   config.headers['Authorization'] = token;
    // }else{
    //     router.push('/login')
    // }
    if(localStorage.token){
        // 设置统一请求头
        config.headers.Authorization = localStorage.token
    }
    return config // 将配置完成的config对象返回出去 如果不返回 请求讲不会进行
}, err => {
    // 请求发生错误时的相关处理 抛出错误
    //  //响应失败的返回
    Promise.reject(err)
})



//响应拦截处理  响应拦截器：包含两个函数（一个是成功返回的函数，一个是失败的返回的函数）
api.interceptors.response.use(res => {
    // 我们一般在这里处理，请求成功后的错误状态码 例如状态码是500，404，403
    // res 是所有相应的信息
    // console.log(res)
    if(res.data.data.code == 1000){
        localStorage.removeItem('token')
        showFailToast('登录过期，请重新登录')
        return router.push('/login')
    }
    
    return res.data
}, err => {
    
    // 服务器响应发生错误时的处理
    Promise.reject(err)
})


//最后一步 暴露出去实例导出
export default api
   