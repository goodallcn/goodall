<template>
  <div class="home">
    <div class="headers">
      <!-- 头部组件 -->
      <Header></Header>
    </div>

    <section
      class="wrapper"
      ref="wrapper"
    >
    <list-scroll>
      <div class="test1">
        <!-- 解决better-scroll默认向上移动的问题 1 -->
        <!-- <div style="height: 1px;margin-top: -1px"></div> -->
        <div>
          <!-- 轮播图 -->
          <Swipe></Swipe>
          <!-- 图标 -->
          <Icon></Icon>
          <!-- 火爆推荐 -->
          <Recommend></Recommend>
          <!-- 新品上线 -->
          <Ad></Ad>
          <!-- 猜你喜欢 -->
          <Like></Like>
          <!-- 最新推荐 -->
          <News></News>
          <div></div>
        </div>
      </div>
    </list-scroll>
    </section>
    <Tabbar></Tabbar>
  </div>

</template>

<script>
import Tabbar from "@/components/common/Tabbar.vue";
import Header from "@/components/common/Header.vue";
import Swipe from "@/components/home/Swipe.vue";
import Icon from "@/components/home/Icon.vue";
import Recommend from "@/components/home/Recommend.vue";
import Ad from "@/components/home/Ad.vue";
import Like from "@/components/home/Like.vue";
import News from "@/components/home/News.vue";
// import BetterScroll from "better-scroll";
import listScroll from "@/components/common/listScroll.vue";

// import { getUser } from "@/common/https.js";
// import bus from "@/bus";
export default {
  // inject: ["reload"], // 引入方法
  // created() {
  //   this.getData();
  // },
  // methods: {
    // async getData() {
    //   // const res = await this.$axios.get("/users/login");
    //   await getUser().then((res) => {
    //     console.log(res);
    //   });
    // },
   
  // },
  // mounted() {
  //   this.$nextTick(() => {
  //     // 先渲染完图片，再加载使用滚动插件
  //     this.scroll = new BetterScroll(this.$refs.wrapper, {
  //       movable: true,
  //       zoom: true,
  //       click: true,
  //       mouseWheel: true
  //     });
  //     //通过$bus()方法监听News中图片加载情况
  //     bus.$on("itemImageLoad", () => {
  //       this.scroll.refresh();
  //     });
  //   });
  // },
  components: {
    Tabbar,
    Header,
    Swipe,
    Icon,
    Recommend,
    Ad,
    Like,
    News,
    listScroll
  },
};
</script>

<style lang="scss">
.home {
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  background-color: #f9f9f9;
  .headers {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 1.3333rem;
    z-index: 999;
  }
  section {
    flex: 1;
    overflow: hidden;
    margin-bottom: 1.6rem;
    .test1 {
      //解决better-scroll默认向上移动的问题 2
      padding: 1px 0px;
      //解决better-scroll默认向上移动的问题 3
      // border:1px solid #fff;
    }
  }
}
</style>