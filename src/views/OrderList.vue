<template>
  <div class="orderList">
    <my-header>
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="this.$router.push('/my')"
        ></i>
      </template>
      <template #title>我的订单</template>

      <template #icons>
        <i
          class="iconfont icon-shenglve"
          @click="this.$router.push('/my')"
        ></i>
      </template>
    </my-header>
    <section>
      <div class="content">
        <van-list
          v-model="loading"
          :finished="finished"
          finished-text="没有更多了"
          @load="onLoad"
        >
          <div
            class="order-item-box"
            @click="goTo(item)"
            v-for="(item,index) in list"
            :key="index"
          >

            <div class="order-item-header">
              <span>订单时间：{{ formatDate(item.create_time)}}</span>
              <span :style="{color: item.order_status == 1 ? 'red' : ''}">{{ item.order_status == 1 ? '未支付' : '已支付' }}</span>
            </div>
            <van-swipe-cell>
              <van-card
                :num=item.goods_num
                :price=item.goods_price
                desc="全场包邮"
                :title=item.goods_name
                thumb="./images/ipad.jpg"
              />

              <template #right>
                <van-button
                  square
                  text="删除"
                  type="danger"
                  class="delete-button"
                  @click="deleteOrd(item.id)"
                />
              </template>
            </van-swipe-cell>
          </div>

        </van-list>
      </div>
    </section>
  </div>
</template>

<script>
import myHeader from "@/components/common/myHeader.vue";
import { getOrder,deleteOrder } from "@/common/https";
import { showConfirmDialog, showToast } from 'vant';
export default {
  inject: ["reload"], // 引入方法
  name: "OrderList",
  data() {
    return {
      list: [],
      loading: false,
      finished: false,
      status: "",
    };
  },
  created() {
    this.getData();
  },
  methods: {
    getData() {
      getOrder({
        token: localStorage.getItem("token"),
      }).then((res) => {
        this.list = res.data.data;
      });
    },
    onLoad() {},
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
    goTo(item) {
      this.$router.push({
        name: "OrderDetail",
        query: {
          id: item.id,
          order_status: JSON.stringify(item.order_status),
        },
      });
    },
    // 删除订单
    deleteOrd(id){
      showConfirmDialog({
        message: "是否删除订单？",
        cancel: false,
      }).then(()=>{
        deleteOrder({
        id
      }).then(res=>{
        if(!res.data.success) return
        showToast(res.data.msg)
        setTimeout(()=>{
        this.reload()
        },1000)      
      })
      })
    
    }
  },

  components: {
    myHeader,
  },
};
</script>

<style lang="scss" scoped>
.orderList {
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  i {
    font-size: 0.5333rem;
  }
  section {
    .content {
      height: calc(100vh - 1.86667rem);
      overflow: hidden;
      overflow-y: scroll;
      margin-top: 34px;
      .van-list {
        margin-bottom: 50px;

        .order-item-box {
          margin: 20px 10px;
          background-color: #fff;
          .order-item-header {
            display: flex;
            justify-content: space-between;
            padding: 10px 20px 0 20px;
            span {
              font-size: 0.32rem;
            }
          }
          .van-swipe-cell {
            .delete-button {
              height: 100%;
            }
            .van-card {
              background-color: #fff;
              margin-top: 0;
              margin: 0;
              .van-card__content {
                display: flex;
                flex-direction: column;
                justify-content: center;
              }
            }
          }
        }
      }
    }
  }
}
</style>