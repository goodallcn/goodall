<template>
  <div class="tabbar">
    <ul>
      <li
        v-for="(item,index) in routerList"
        :key="index"
        @click="switchTab(item.path)"
      >
        <p :class="$route.path.includes(item.path) ? item.selected : item.active"></p>
        <span :class="$route.path.includes(item.path) ? 'active': ''">{{item.title}}</span>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "Tabbar",
  data() {
    return {
      routerList: [
        {
          title: "首页",
          path: "/index",
          active: "iconfont icon-shouye",
          selected: "iconfont icon-shouye-1",
        },
        {
          title: "分类",
          path: "/list",
          active: "iconfont icon-fenlei",
          selected: "iconfont icon-fenlei-1",
        },
        {
          title: "购物车",
          path: "/cart",
          active: "iconfont icon-gouwugouwuchedinggou",
          selected: "iconfont icon-gouwugouwuchedinggou-1",
        },
        {
          title: "我的",
          path: "/my",
          active: "iconfont icon-wode",
          selected: "iconfont icon-wode-1",
        },
      ],
    };
  },
  methods: {
    switchTab(path) {
      // 对应跳转页面
      this.$router.replace(path);
    },
  },
};
</script>

<style lang="scss" scoped>
.tabbar {
  position: fixed;
  left: 0;
  bottom: 0;
  z-index: 999;
  width: 100%;
  height: 1.3333rem;
  background-color: #fff;
  border-top: 1px solid #eee8e8;
  ul {
    display: flex;
    justify-content: space-between;
    flex-direction: row;
    align-content: center;
    li {
      display: flex;
      flex: 1;
      flex-direction: column;
      text-align: center;
      align-items: center;
      p {
        text-align: center;
        font-size: 0.58667rem;
        line-height: 0.93rem;
      }
      span {
        font-size: 0.32rem;
      }
    }
  }
}
.active {
  color: #1baeae;
}
.icon-shouye-1 {
  color: #1baeae;
}
.icon-fenlei-1 {
  color: #1baeae;
}
.icon-gouwugouwuchedinggou-1 {
  color: #1baeae;
}
.icon-wode-1 {
  color: #1baeae;
}
</style>