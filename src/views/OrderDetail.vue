<template>
  <div class="orderDetail">
    <my-header style="background-color: #fff;">
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="this.$router.back()"
        ></i>
      </template>
      <template #title>订单详情</template>
      <template #icons>
        <i class="iconfont icon-shenglve"></i>
      </template>
    </my-header>
    <section
      v-for="item in list"
      :key="item.id"
    >
      <div class="order-status">
        <div class="status-item">
          <label>订单状态：</label>
          <span>{{   order_status == 1 ?   "未支付" : "已支付"}}</span>
        </div>
        <div class="status-item">
          <label>订单编号：</label>
          <span>{{ item.order_id }}</span>
        </div>
        <div class="status-item">
          <label>下单时间：</label>
          <span>{{formatDate(item.create_time) }}</span>
        </div>
        <van-button
          v-if="order_status==1"
          style="margin-bottom: 10px"
          color="#1baeae"
          block
          @click="showPayFn"
        >去支付</van-button>
        <van-button
          v-if="order_status==2"
          style="margin-bottom: 10px"
          block
        >已完成</van-button>
      </div>

      <div class="order-price">
        <div class="price-item">
          <label>商品金额：</label>
          <span>¥ {{ item.goods_price }}</span>
        </div>
        <div class="price-item">
          <label>配送方式：</label>
          <span>普通快递</span>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import myHeader from "@/components/common/myHeader.vue";
import { orderDetail, changeOrder } from "@/common/https";
import {  showToast } from "vant";
export default {
  name: "orderDetail",
  data() {
    return {
      id: "",
      order_status: "",
      list: [],
    };
  },
  created() {
    this.getData();
    this.id = this.$route.query.id;
    this.order_status = JSON.parse(this.$route.query.order_status);
  },

  methods: {
    getData() {
      orderDetail({
        id: this.$route.query.id,
      }).then((res) => {
        this.list = res.data.data;
      });
    },
    formatDate(time) {
      let timestamp = new Date(time).getTime(); // 将时间字符串转换为时间戳
      let date = new Date(timestamp); // 将时间戳转换为日期对象
      let year = date.getFullYear().toString().padStart(2, "0");
      let month = (date.getMonth() + 1).toString().padStart(2, "0");
      let day = date.getDate().toString().padStart(2, "0");
      let hours = date.getHours().toString().padStart(2, "0");
      let minutes = date.getMinutes().toString().padStart(2, "0");
      let seconds = date.getSeconds().toString().padStart(2, "0");
      return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    },
    showPayFn() {
      changeOrder({
        id: this.$route.query.id,
        token: localStorage.getItem("token"),
      }).then((res) => {
        showToast({
            message:res.data.msg
        })
        setTimeout(() => {
          // 延迟跳转
          this.$router.push("/orderList");
        }, 1000); // 1秒后跳转
      });
    },
  },
  components: {
    myHeader,
  },
};
</script>

<style lang="scss" scoped>
.orderDetail {
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  background: #f7f7f7;
  i {
    font-size: 0.5333rem;
  }
  .order-status {
    background: #fff;
    padding: 0.5333rem;
    font-size: 0.4rem;
    .status-item {
      margin-bottom: 0.4rem;
      label {
        color: #999;
      }
      span {
        font-family: Avenir, Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        color: #2c3e50;
      }
    }
  }
  .order-price {
    background: #fff;
    margin: 20px 0;
    padding: 20px;
    font-size: 15px;
    .price-item {
      margin-bottom: 10px;
      label {
        color: #999;
      }
      span {
        font-family: Avenir, Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        color: #2c3e50;
      }
    }
  }
}
</style>