import { showFailToast } from "vant";
import { createRouter, createWebHistory } from "vue-router";
import Index from "../views/Index.vue";

const routes = [
  {
    path: '/',
    redirect: '/index'
  },
  // 首页
  {
    path: "/index",
    name: "Index",
    component: Index,
    meta: {
      title: '首页',
      keepAlive: true,
    },
  },
  // 分类页面
  {
    path: "/list",
    name: "List",
    // route level code-splitting
    // this generates a separate chunk (list.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "@/views/List.vue"),
      meta: {
        title: '分类',
        keepAlive: true,
      },
  },
  // 购物车页面
  {
    path:"/cart",
    name:"Cart",
    component:() =>
     import("@/views/Cart.vue"),  
  },
  // 个人页面
  {
    path:"/my",
    name:"My",
    component:() =>
      import("@/views/My.vue"),
    
  },
  // 搜索页面
  {
    path:"/search",
    name:"Search",
    children: [
      {
        path: '',
        name: 'index',
        component: () => import('@/views/search/search-index.vue')
      },
      {
        path: 'list',
        name: 'list',
        component: () => import('../views/search/search-list.vue'),
        
      }
    ],
    component:() =>
      import("@/views/Search.vue"),
  },
  // 商品详情页面
  {
    path:"/detail",
    name:"Detail",
    component:() =>
      import("@/views/Detail.vue"),
    
  },
  // 登录页面
  {
    path:"/login",
    name:"Login",
    component:() =>
      import("@/views/login/Login.vue"),
    
  },
  // 注册页面
  {
    path:"/register",
    name:"Register",
    component:() =>
      import("@/views/login/Register.vue"),
    
  },
  // 找回密码
  {
    path: "/recovery",
    name: "Recovery",
    children: [
      {
        path: "",
        name: "indexRecovery",
        component: () =>
          import("../views/recovery/RecoveryIndex.vue"),
      },
      {
        path: "btn",
        name: "btn",
        component: () =>
          import("../views/recovery/RecoveryBtn.vue"),
      }
    ],
    component: () => import('@/views/recovery/Recovery.vue')
  },
  // 地址管理
  {
    path:"/path",
    name:"Path",
    children: [
      {
        path: "",
        name: "indexPath",
        component: () =>
          import("../views/path/pathIndex.vue"),
      },
      {
        path: "pathList",
        name: "pathList",
        component: () =>
          import("../views/path/pathList.vue"),
      },
      {
        path: "pathEdit",
        name: "pathEdit",
        component: () =>
          import("../views/path/pathEdit.vue"),
      }
    ],
    component:() =>
      import("@/views/Path.vue"),
    
  },
  // 订单页面
  {
    path: '/order',
    name: 'Order',
    component: () => import('../views/Order.vue'),
    meta: {
      title: '订单页面',
      keepAlive: true,
    },
  
  },
  // 我的订单
  {
    path: '/orderList',
    name: 'OrderList',
    component: () => import('../views/OrderList.vue'),
  },
  // 订单详情页面
  {
    path: '/orderDetail',
    name: 'OrderDetail',
    component: () => import('../views/OrderDetail.vue'),
  },
  // 关于goodall
  {
    path: '/aboutGoodall',
    name: 'About',
    component: () => import('../views/About.vue'),
  },

];



const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

router.beforeEach((to,from,next)=>{
    
  let nextRoute = ['Cart','Path','Order','OrderList','pathEdit','pathList',"indexPath"];
  //是否是登录中
  let userInfo = JSON.parse( localStorage.getItem('token')  );
  
  //当前进入的页面，是不是需要验证哪些页面
  if(  nextRoute.indexOf( to.name ) >= 0  ){
      if( !userInfo ){
          router.push('/login');
          showFailToast('未登录')
      }
  }
  
  next();
})

export default router;
