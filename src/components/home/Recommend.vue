<template>
  <header>
    <Card>
      <span class="slotName">火爆推荐</span>
    </Card>
  </header>
  <div class="recommend">
    <ul>
      <li
        v-for="(item,index) in recommendList"
        :key="index"
        @click="goDetail(item.detail_id)"
      >
        <img
          v-lazy="item.goods_img"
          alt=""
        >
        <div class="reContent">
          <h3>{{ item.goods_name }}</h3>
          <span>{{ item.goods_content }}</span>
          <div class="rePrice">
            <p>￥</p>
            <b>{{ item.goods_price }}</b>
          </div>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import Card from "@/components/home/Card.vue";
import { getHots } from "@/common/https.js";

export default {
  name: "Recommend",
  data() {
    return {
      recommendList: [],
    };
  },
  created() {
    this.getDatas();
  },
  methods: {
    async getDatas() {
      await getHots().then((res) => {
        if (!res.success) {
          console.log("获取商品数据失败");
        } else {
          this.recommendList = res.data;
        }
      });
    },
    goDetail(id){
      this.$router.push({
        path:'/detail',
        query:{
          id:id
        }      
      })
    }
  },
  components: {
    Card,
  },
};
</script>

<style lang="scss" scoped>
header {
  margin-top: 0.2667rem;
  .slotName {
    font-weight: 700;
  }
}

.recommend {
  width: 100%;
  ul {
    li {
      position: relative;
      display: flex;
      height: 3.7333rem;
      align-items: center;
      font-size: 0.37333rem;
      padding: 0.1333rem 0.2667rem;
      margin: 0.2667rem 0;
      background-color: #fff;
      img {
        width: 3.2rem;
        height: 3.2rem;
      }
      .reContent {
        margin-left: 0.2667rem;
        margin-bottom: 0.5333rem;
        font-size: 0.4rem;
        h3 {
          text-align: center;
          font-size: 0.5333rem;
          font-weight: 700;
          margin-bottom: 0.2667rem;
        }

        .rePrice {
          position: absolute;
          right: 0.2667rem;
          bottom: 10px;
          display: flex;
          font-size: 0.48rem;
          color: red;
          p {
            font-weight: 600;
          }
          b {
            font-weight: 700;
          }
        }
      }
    }
  }
}
</style>