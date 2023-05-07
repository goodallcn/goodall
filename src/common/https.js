import api from "./api.js"



// 获取轮播图数据
export const getSwipe = (params) =>{
  return api({
    method: 'get',
    url: '/goods/swipe',
    params
  })
};

// 获取火爆推荐商品数据
export const getHots = (params) =>{
  return api({
    method: 'get',
    url: '/goods/hots',
    params
  })
};

// 获取猜你喜欢商品数据
export const getLikes = (params) =>{
  return api({
    method: 'get',
    url: '/goods/likes',
    params
  })
};

// 获取新品上线商品数据
export const getNews = (params) =>{
  return api({
    method: 'get',
    url: '/goods/news',
    params
  })
};

// 获取最新推荐商品数据
export const getRecoms = (params) =>{
  return api({
    method: 'get',
    url: '/goods/recoms',
    params
  })
};


export const getGoods = (params) => {
  return api({
    method: 'get',
    url: '/goods/goodsList',
    params
  })
};

// 获取搜索数据
export const getShoop = (params) => {

 return api({
   method: 'get',
   url: '/goods/searchGoods',
   params
 })
};

// 获取分类标题数据
export const getListTitle = (params) => {
  return api({
    method: 'get',
    url: '/goods/listTitle',
    params
  })
 };

 // 获取分类商品数据
export const getLists = (params) => {
  return api({
    method: 'get',
    url: '/goods/lists',
    params
  })
 };

  // 获取商品详情数据
export const getDetails = (params) => {
  return api({
    method: 'get',
    url: '/goods/detail',
    params
  })
 };
 
 
// 登录
export const login = (data) => {
  return api({
    method: 'post',
    url: '/users/login',
    data,

  })
}

// 注册
export const register = (data) => {
  return api({
    method: 'post',
    url: '/users/register',
    data,

  })
}

// 修改密码，查询账户是否存在
export const selectUser = (data) => {
  return api({
    method: 'post',
    url: '/users/selectUser',
    data,

  })
}

// 修改密码
export const recovery = (data) => {
  return api({
    method: 'post',
    url: '/users/recovery',
    data,

  })
}


// 加入购物车
export const addCarts = (data) => {
  return api({
    method: 'post',
    url: '/carts/addCart',
    data,
  })
}

// 查询购物车数据
export const selectCart = (data) => {
  return api({
    method: 'post',
    url: '/carts/selectCart',
    data,
  })
}

// 删除购物车数据
export const deleteCart = (data) => {
  return api({
    method: 'post',
    url: '/carts/deleteCart',
    data,
  })
}

// 修改购物车数量
export const updateCart = (data) => {
  return api({
    method: 'post',
    url: '/carts/updateCart',
    data,
  })
}

//新增地址
export const addNews = (data) => {
  return api({
    method: 'post',
    url: '/address/addNews',
    data,
  })
}

//获取收货地址
export const getAddress = (data) => {
  return api({
    method: 'post',
    url: '/address/getAddress',
    data,
  })
}

//修改收货地址
export const updateAddress = (data) => {
  return api({
    method: 'post',
    url: '/address/updateAddress',
    data,
  })
}

//删除收货地址
export const deleteAddress = (data) => {
  return api({
    method: 'post',
    url: '/address/deleteAddress',
    data,
  })
}


//生成订单
export const addOrder = (data) => {
  return api({
    method: 'post',
    url: '/order/addOrder',
    data,
  })
}

//查询订单
export const selectOrder = (data) => {
  return api({
    method: 'post',
    url: '/order/selectOrder',
    data,
  })
}

//提交订单
export const submitOrder = (data) => {
  return api({
    method: 'post',
    url: '/order/submitOrder',
    data,
  })
}


//获取订单
export const getOrder = (data) => {
  return api({
    method: 'post',
    url: '/order/getOrder',
    data,
  })
}

//订单详情
export const orderDetail = (data) => {
  return api({
    method: 'post',
    url: '/order/orderDetail',
    data,
  })
}

//修改订单状态
export const changeOrder = (data) => {
  return api({
    method: 'post',
    url: '/order/changeOrder',
    data,
  })
}

//删除订单
export const deleteOrder = (data) => {
  return api({
    method: 'post',
    url: '/order/deleteOrder',
    data,
  })
}