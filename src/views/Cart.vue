<template>
  <div class="cart">
    <my-header>
      <template #back>
        <i
          class="iconfont icon-zhuye"
          @click="this.$router.push('/index')"
        ></i>
      </template>
      <template #title>购物车</template>
      <template #icons>
        <span
          @click="isNavBar"
          v-text='isNavStatus ? "完成" : "编辑"'
        ></span>
      </template>
    </my-header>
    <section v-if="list.length">
      <list-scroll>
        <div>
          <div
            v-for="(item,index) in list"
            :key="index"
          >
            <div class="cart-body">
              <van-swipe-cell>
                <div class="card">
                  <div class="checkBox">
                    <van-checkbox
                      @click="itemCheck(index)"
                      v-model="item.checked"
                    ></van-checkbox>
                  </div>
                  <div class="good-img">
                    <img
                      v-lazy="item.goods_img"
                      alt=""
                    >
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
                      <div class="vant-stepeer">
                        <van-stepper
                          @change="changeNum($event,item)"
                          v-model="item.goods_num"
                          integer
                        />
                      </div>
                    </div>
                  </div>

                </div>
                <template #right>
                  <van-button
                    square
                    text="删除"
                    type="danger"
                    class="delete-button"
                    @click="delGoodsFn(item.id)"
                  />
                </template>
              </van-swipe-cell>

            </div>
          </div>
        </div>

      </list-scroll>

    </section>
    <section v-else>
      <div class="empty">
        <img
          src="https://s.yezgea02.com/1604028375097/empty-car.png"
          alt="空购物车"
        >
        <div class="title">购物车空空如也</div>
        <van-button
          type="success"
          @click="this.$router.push('/list')"
        >前往购物</van-button>
      </div>
    </section>
    <footer v-if="list.length">
      <div class="submit-bar">
        <div></div>
        <div class="checkAll">
          <van-checkbox
            :modelValue="isCheckedAll"
            @click="checkAllFn"
          ></van-checkbox>
          <span>全选</span>
        </div>
        <div
          class="bar-text"
          v-show="!isNavStatus"
        >
          <span>合计：</span>
          <span class="money">￥</span>
          <span class="priceAll">{{total.price.toFixed(2)}}</span>
        </div>
        <van-button
          type="success"
          @click="goOrder"
          v-if="!isNavStatus"
        >结算({{ total.num }})</van-button>
        <van-button
          type="success"
          @click="delGoodsFn"
          v-else
        >删除</van-button>
      </div>
    </footer>
    <Tabbar></Tabbar>
  </div>

</template>

<script>
import myHeader from "@/components/common/myHeader.vue";
import Tabbar from "@/components/common/Tabbar.vue";
import { selectCart, updateCart, addOrder } from "@/common/https.js";
import { mapMutations, mapGetters, mapActions, mapState } from "vuex";
import listScroll from "@/components/common/listScroll.vue";
import { showToast, showConfirmDialog } from "vant";
export default {
  name: "Cart",
  data() {
    return {
      checked: false,
      value: 1,
      isNavStatus: false,
    };
  },
  computed: {
    ...mapState({
      list: (state) => state.cart.list,
      selectList: (state) => state.cart.selectList,
    }),
    ...mapGetters(["isCheckedAll", "total"]),
    goodList() {
      return this.selectList.map((id) => {
        return this.list.find((v) => v.id == id);
      });
    },
  },
  created() {
    this.getData();
  },
  methods: {
    ...mapMutations(["cartList", "itemCheck", "initOrder"]),
    ...mapActions(["checkAllFn", "delGoodsFn"]),
    getData() {
      selectCart({
        headers: {
          token: localStorage.getItem("token"),
        },
      }).then((res) => {
        res.data.data.forEach((v) => {
          v["checked"] = true;
        });
        this.cartList(res.data.data);
      });
    },
    // 点击编辑
    isNavBar() {
      this.isNavStatus = !this.isNavStatus;
    },
    // 修改数量
    changeNum(value, item) {
      updateCart({
        data: {
          id: item.id,
          num: value,
        },
      });
    },
    // 结算前往订单
    goOrder() {
      if (!this.selectList.length) {
        showToast("请至少选择一件商品");
        return;
      }
      showConfirmDialog({
        message: "是否前往结算页面？",
        cancel: false,
      }).then(() => {
        let newList = [];
        this.list.forEach((item) => {
          this.selectList.filter((v) => {
            if (v == item.id) {
              newList.push(item);
            }
          });
        });
        //  生成订单
        addOrder({
          token: localStorage.getItem("token"),
          arr: JSON.stringify(newList),
          shopArr: JSON.stringify(this.selectList),
        }).then((res) => {
          if (!res.data.success) return;
          // 存储订单号
          this.initOrder(res.data.data);
          this.$router.push({
            path: "/order",
            query: {
              detail: JSON.stringify(this.selectList),
              goodList: JSON.stringify(this.goodList),
            },
          });
        });
      });
    },
  },
  components: {
    Tabbar,
    myHeader,
    listScroll,
  },
};
</script>

<style lang="scss" scoped>
.cart {
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  i {
    font-size: 0.5867rem;
  }
  span {
    font-size: 0.4rem;
  }
  section {
    margin: 0.42667rem 0 2.66667rem 0;
    padding-left: 0.26667rem;
    overflow: hidden;
    // display: flex;
    // flex-direction: column;
    .empty {
      width: 50%;
      margin: 0 auto;
      text-align: center;
      margin-top: 5.33333rem;
      img {
        width: 4rem;
        margin-bottom: 0.53333rem;
      }
      .title {
        font-size: 0.42667rem;
        margin-bottom: 0.53333rem;
      }
      .van-button--success {
        width: 5.3333rem;
        height: 1.06667rem;
        font-weight: 500;
        border: none;
        background: #1baeae;
        border-radius: 26.64rem;
        padding: 0 0.4rem;
        font-size: 0.37333rem;
      }
    }
    .cart-body {
      margin-bottom: 0.2667rem;
      .card {
        display: flex;
        .checkBox {
          display: flex;
          align-items: center;
          overflow: hidden;
          cursor: pointer;
        }
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
              height: .96rem;
              font-size: 0.32rem;
              font-family: Avenir, Helvetica, Arial, sans-serif;
              -webkit-font-smoothing: antialiased;
              color: #222;
              overflow: hidden;
              text-overflow: ellipsis;
              display: -webkit-box;
              -webkit-line-clamp: 2;
              -webkit-box-orient: vertical;
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
          margin-top: 0.2667rem;
          margin-left: 0.2667rem;
          .price {
            font-size: 0.42667rem;
            color: red;
            line-height: 0.74667rem;
          }
        }
      }
      .delete-button {
        height: 100%;
      }
    }
  }
  footer {
    border-top: 0.0267rem solid #f8f8f8;
    position: fixed;
    bottom: 1.3333rem;
    left: 0;
    z-index: 998;
    width: 100%;
    padding: 0.16rem 0;
    background-color: #fff;
    .submit-bar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 0.42667rem;
      font-size: 0.37333rem;

      .checkAll {
        display: flex;
        align-items: center;
        flex: 1;
        span {
          margin-left: 0.16rem;
          font-size: 0.3733rem;
        }
      }
      .bar-text {
        flex: 2;
        .money {
          color: #ee0a24;
        }
        .priceAll {
          font-size: 0.53333rem;
          color: #ee0a24;
          font-weight: 500;
        }
      }
      .van-button--success {
        width: 2.93333rem;
        height: 1.06667rem;
        font-weight: 500;
        border: none;
        background: #1baeae;
        border-radius: 26.64rem;
        padding: 0 0.4rem;
        font-size: 0.37333rem;
      }
    }
  }
}
</style>