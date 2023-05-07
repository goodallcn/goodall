<template>
  <div class="detail">
    <my-header>
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="this.$router.back()"
        ></i>
      </template>
      <template #title>商品详情页</template>
      <template #icons>
        <i
          class="iconfont icon-shenglve"
          @click="this.$router.push('/my')"
        ></i>
      </template>
    </my-header>
    <section>
      <list-scroll
        v-for="(item,index) in detailList"
        :key="index"
      >
        <div class="test1">
          <div class="swipe-img">
            <img v-lazy="item.img_url">
          </div>
          <div class="product-info">
            <div class="product-title">{{ item.goods_name }}</div>
            <div class="product-desc">免邮费 顺丰快递</div>
            <div class="product-price">
              <span>¥{{ item.goods_price }}</span>
            </div>
          </div>
          <div class="product-intro">
            <ul>
              <li>概述</li>
              <li>参数</li>
              <li>售后服务</li>
              <li>常见问题</li>
            </ul>
          </div>
          <div class="product-content">
            <img
              v-lazy="item.img1"
              alt=""
            >
            <img
              v-lazy="item.img2"
              alt=""
            >
            <img
              v-lazy="item.img3"
              alt=""
            >
          </div>
        </div>
      </list-scroll>
    </section>
    <footer>
      <van-action-bar>
        <van-action-bar-icon
          icon="chat-o"
          text="客服"
        />
        <van-action-bar-icon
          icon="cart-o"
          text="购物车"
          @click="this.$router.push('/cart')"
        />
        <van-action-bar-button
          color="#be99ff"
          type="warning"
          text="加入购物车"
          @click="addCart"
          style="background: linear-gradient(90deg,#6bd8d8,#1baeae);"
        />
        <van-action-bar-button
          color="#7232dd"
          type="danger"
          text="立即购买"
          style="background: linear-gradient(90deg,#0dc3c3,#098888);"
        />
      </van-action-bar>
    </footer>
  </div>
</template>

<script>
import listScroll from "@/components/common/listScroll.vue";
import myHeader from "@/components/common/myHeader.vue";
// import BetterScroll from "better-scroll";
// import ObserveDOM from "@better-scroll/observe-dom";
// import ObserveImage from '@better-scroll/observe-image'

import { getDetails,addCarts } from "@/common/https.js";
// BetterScroll.use(ObserveDOM,ObserveImage);
import { showFailToast, showToast } from "vant";
export default {
  name: "Detail",
  data() {
    return {
      detailList: [],
    };
  },
  created() {
    this.getShoops();
  },

  methods: {
    async getShoops() {
      await getDetails({
        detailId: this.$route.query.id,
      }).then((res) => {
        this.detailList = res.data;
      });
    },
    // 加入购物车
    addCart(){
      let token = localStorage.getItem('token')
      if(!token){
        this.$router.push('/login')
        showFailToast('未登录')
      }else{
        let id = this.$route.query.id
      addCarts({
        data:{
          goodsId: id
        },
        headers:{
          token:localStorage.getItem('token')
        }
      }).then(res=>{
        if(!res.data.success) return
        showToast({
          message:res.data.msg,
          position: 'bottom',
      })
      })
      }
    
    }
  },

  components: {
    listScroll,
    myHeader,
  },
};
</script>

<style lang="scss" scoped>
.detail {
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  i{
    font-size: .5333rem;
  }
  section {
    overflow: hidden;
    margin-bottom: 1.3333rem;
    .swipe-img {
      height: 10rem;
      padding: 0.6667rem;
      img {
        width: 100%;
      }
    }
    .product-info {
      padding: 0 0.2667rem;
      .product-title {
        font-size: 0.48rem;
        text-align: left;
        color: #333;
      }
      .product-desc {
        font-size: 0.37333rem;
        text-align: left;
        color: #999;
        padding: 0.13333rem 0;
      }
      .product-price {
        span {
          color: #f63515;
          font-size: 0.58667rem;
        }
      }
    }
    .product-intro {
      padding: 0 0.2667rem;
      ul {
        display: flex;
        justify-content: space-between;
        width: 100%;
        margin: 0.26667rem 0;
        li {
          width: 25%;
          padding: 0.13333rem 0;
          text-align: center;
          font-size: 0.4rem;
          border-right: 0.02667rem solid #999;
          box-sizing: border-box;
        }
        li:last-child {
          border-right: none;
          margin-right: 0.0267rem;
        }
      }
    }
    .product-content {
      padding: 0 0.2667rem;
      img {
        width: 8.9333rem;
      }
    }
  }
  footer {
    display: flex;
    width: 100%;
    height: 1.3333rem;
    z-index: 999;
  }
}
</style>