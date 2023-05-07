<template>
  <div class="order">
    <my-header style="background-color: #fff;">
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="this.$router.back()"
        ></i>
      </template>
      <template #title>订单结算</template>
      <template #icons>
        <i class="iconfont icon-shenglve"></i>
      </template>
    </my-header>
    <section>
      <div
        class="address-wrap"
        @click="goPath"
      >
        <div
          v-if="!path"
          class="addText"
        >请选择收货地址</div>

        <div v-else>
          <div class="name">
            <span>{{path.name}} </span>
            <span>{{path.tel}}</span>
          </div>
          <div class="address">
            <span>{{path.province}} </span>
            <span>{{path.city}} </span>
            <span>{{path.county }} </span>
            <span>{{path.addressDetail }} </span>
          </div>
          <i class="iconfont icon-youjiantou"></i>
        </div>
      </div>
      <div class="good">
        <list-scroll>
          <div>
            <div
              class="card"
              v-for="(item,index) in goodList"
              :key="index"
            >
              <div class="good-img">
                <img v-lazy="item.goods_img">
              </div>
              <div class="good-desc">
                <div class="good-tnum">
                  <div class="good-title">
                    {{ item.goods_name }}
                  </div>
                  <div class="good-num">
                    <span>x{{ item.goods_num }}</span>
                  </div>
                </div>
                <div class="good-btn">
                  <div class="price">￥{{ item.goods_price }}</div>
                </div>
              </div>
            </div>
          </div>
        </list-scroll>
      </div>
    </section>
    <footer>
      <div class="pay-wrap">
        <div class="price">
          <span>商品金额</span>
          <span>¥{{total.price}}</span>
        </div>
        <van-button
          @click="handleCreateOrder"
          class="pay-btn"
          color="#1baeae"
          type="primary"
          block
        >支付</van-button>
      </div>

    </footer>
  </div>
</template>

<script>
import myHeader from "@/components/common/myHeader.vue";
import listScroll from "@/components/common/listScroll.vue";
import { showToast } from "vant";
import { mapGetters, mapMutations, mapState } from "vuex";
import { getAddress, selectOrder, submitOrder } from "@/common/https";
import bus from "@/bus";
export default {
  name: "Order",
  data() {
    return {
      path: {},
      item: [],
      goodList: {},
      total: {
        price: 0,
        num: 0,
      },
    };
  },
  created() {
    this.getAddress();
  },
  activated() {
    bus.$on(
      "selectPath",
      function (data) {
        this.path = JSON.parse(data);
      }.bind(this)
    );
    this.getOrder();
    // 选择商品的id
    this.item = JSON.parse(this.$route.query.detail);
    // 商品
    this.goodList = JSON.parse(this.$route.query.goodList);
  },
  computed: {
    ...mapState({
      order_id: (state) => state.order.order_id,
      selectList: (state) => state.cart.selectList,
      list: (state) => state.cart.list,
    }),
    ...mapGetters(["defaultPath"]),
  },
  methods: {
    ...mapMutations(["initData", "initOrder"]),
    // 收货地址
    getAddress() {
      getAddress({
        token: localStorage.getItem("token"),
      }).then((res) => {
        this.initData(res.data.data);
        // 有默认收货地址;
        if (this.defaultPath.length) {
          this.path = this.defaultPath[0];
        } else {
          this.path = res.data.data[0] || "";
        }
      });
    },
    // 选择收货地址
    goPath() {
      this.$router.push({
        path: "/path",
        query: {
          type: "select",
        },
      });
    },
    // 查询订单
    getOrder() {
      selectOrder({
        orderId: this.order_id,
      }).then((res) => {
        this.initOrder(res.data.data);

        this.total = {
          price: res.data.data[0].goods_price,
          num: res.data.data[0].goods_num,
        };
      });
    },
    handleCreateOrder() {
      //判断是否选择了收货地址
      if (!this.path) return showToast("请填写收货地址");
      // 发送请求，修改订单状态，删除购物车数据
      submitOrder({
        orderId: this.order_id,
        token: localStorage.getItem("token"),
      }).then((res) => {
        if (!res.data.success) return;
        showToast(res.data.msg);
        setTimeout(() => {
          // 延迟跳转
          this.$router.push("/orderList");
        }, 2000); // 2秒后跳转
      });
    },
  },
  components: {
    myHeader,
    listScroll,
  },
};
</script>

<style lang="scss" scoped>
.order {
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  background-color: #f9f9f9;

  i {
    font-size: 0.5333rem;
  }
  section {
    overflow: hidden;
    display: flex;
    flex-direction: column;
    margin-bottom: 2.6667rem;
    .address-wrap {
      margin-bottom: 0.5333rem;
      background: #fff;
      position: relative;
      font-size: 0.3733rem;
      padding: 0.4rem;
      height: 1.4667rem;
      color: #222333;
      .addText {
        font-size: 0.5333rem;
        line-height: 1.4667rem;
      }
      .name,
      .address {
        margin: 0.2667rem 0;
        span {
          padding-left: 0.1333rem;
        }
      }
      .icon-youjiantou {
        position: absolute;
        right: 0.2667rem;
        top: 50%;
        transform: translateY(-50%);
        font-size: 0.8rem;
      }
      &::before {
        position: absolute;
        right: 0;
        bottom: 0;
        left: 0;
        height: 0.0533rem;
        background: -webkit-repeating-linear-gradient(
          135deg,
          #ff6c6c 0,
          #ff6c6c 20%,
          transparent 0,
          transparent 25%,
          #1989fa 0,
          #1989fa 45%,
          transparent 0,
          transparent 50%
        );
        background: repeating-linear-gradient(
          -45deg,
          #ff6c6c 0,
          #ff6c6c 20%,
          transparent 0,
          transparent 25%,
          #1989fa 0,
          #1989fa 45%,
          transparent 0,
          transparent 50%
        );
        background-size: 80px;
        content: "";
      }
    }
    .good {
      display: flex;
      flex-direction: column;
      overflow: hidden;
      background-color: #fff;
      .card {
        display: flex;
        .good-img {
          margin-left: 0.1333rem;
          img {
            width: 2.66667rem;
            height: 2.66667rem;
          }
        }
        .good-desc {
          display: flex;
          flex-direction: column;
          justify-content: space-between;
          flex: 1;
          padding: 0.53333rem;
          .good-tnum {
            display: flex;
            line-height: 1.5;
            .good-title {
              font-size: 0.32rem;
              font-family: Avenir, Helvetica, Arial, sans-serif;
              -webkit-font-smoothing: antialiased;
              color: #222;
              text-overflow: ellipsis;
              display: -webkit-box;
              -webkit-line-clamp: 2;
              -webkit-box-orient: vertical;
              overflow: hidden;
              font-weight: 600;
            }
            span {
              margin-left: 0.2667rem;
              font-size: 0.32rem;
            }
          }
        }
        .good-btn {
          display: flex;
          justify-content: space-between;
          .price {
            font-size: 0.42667rem;
            color: red;
          }
        }
      }
    }
  }
  footer {
    .pay-wrap {
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      background: #fff;
      padding: 10px 0;
      padding-bottom: 50px;
      border-top: 1px solid #e9e9e9;
      > div {
        display: flex;
        justify-content: space-between;
        padding: 0 5%;
        margin: 10px 0;
        font-size: 14px;
        span:nth-child(2) {
          color: red;
          font-size: 18px;
        }
      }
      .pay-btn {
        position: fixed;
        bottom: 7px;
        right: 0;
        left: 0;
        width: 90%;
        margin: 0 auto;
      }
    }
  }
}
</style>