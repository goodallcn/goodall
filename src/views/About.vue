<template>
  <div class="goodall">
    <my-header>
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="this.$router.push('/my')"
        ></i>
      </template>
      <template #title>goodall</template>

      <template #icons>
        <i
          class="iconfont icon-shenglve"
          @click="this.$router.push('/my')"
        ></i>
      </template>
    </my-header>
    <section>
      <div class="about-body">
        <van-divider :style="{ color: '#1baeae', borderColor: '#1baeae', fontSize: '20px', fontWeight: 500 }">简介</van-divider>
        <div>calligraphy-mall 项目是一套电商系统基于 vue3和node.js 及相关技术栈开发。 商城系统包含首页门户、商品分类、新品上线、首页轮播、商品推荐、商品搜索、商品展示、购物车、订单结算、订单流程、个人订单管理等模块。 </div>

        <van-divider :style="{ color: '#1baeae', borderColor: '#1baeae', fontSize: '20px', fontWeight: 500 }">ui模板</van-divider>
        <div>calligraphy-mall 项目的ui模板是参照新蜂商城: <a href="https://github.com/newbee-ltd/newbee-mall-vue3-app">https://github.com/newbee-ltd/newbee-mall-vue3-app</a>  </div>

        <van-divider :style="{ color: '#1baeae', borderColor: '#1baeae', fontSize: '20px', fontWeight: 500 }">作者</van-divider>
        <div>goodall</div>
      </div>
    </section>
  </div>
</template>

<script>
import myHeader from "@/components/common/myHeader.vue";
export default {
  name: "about",
  components: {
    myHeader,
  },
};
</script>

<style lang="scss" scoped>
.goodall {
  
  i {
    font-size: 0.5333rem;
  }
  section{
    box-sizing: border-box;
  padding: 20px;
  }
  .about-body {
    font-size: 16px;
    a {
      color: #007fff;
    }
  }
}
</style>