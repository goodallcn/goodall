<template>
  <header>
    <Card>
      <span class="slotName">最新推荐</span>
    </Card>
  </header>

  <div class="AdContent">

    <div
      class="AdDatail"
      v-for="(item,index) in goodsNews"
      :key="index"
      @click="goDetail(item.detail_id)"
    >
      <h2>
        <img
          v-lazy="item.goods_img"
          alt=""
        >
      </h2>
      <div>
        <h3>{{ item.goods_name + item.goods_content }}</h3>
      </div>
      <div class="AdPrice">
        <span>￥</span>
        <b>{{ item.goods_price }}</b>
      </div>
    </div>
  </div>
</template>
  
  <script>
import Card from "./Card.vue";
import { getRecoms } from "@/common/https.js";
// import bus from "@/bus";
export default {
  name: "Ad",
  data() {
    return {
      goodsNews: [],
    };
  },
  created() {
    this.getDatas();
  },
  methods: {
    async getDatas() {
      await getRecoms().then((res) => {
        if (!res.success) {
          console.log("获取商品数据失败");
        } else {
          this.goodsNews = res.data;
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
    // imageLoad() {
    //   bus.$emit("itemImageLoad");
    // },
  },
  components: {
    Card,
  },
};
</script>
  
  <style lang="scss" scoped>
.slotName {
  font-weight: 700;
}
.AdContent {
  display: flex;
  flex-wrap: wrap;
  background-color: #fff;
  .AdDatail:nth-child(odd) {
    border-right: 1px solid #e9e9e9;
  }
  .AdDatail {
    width: 50%;
    height: 5.6533rem;
    padding: 0.6667rem 0.26667rem;
    box-sizing: border-box;
    border-bottom: 1px solid #e9e9e9;
    h2 {
      text-align: center;
      img {
        width: 3.2rem;
        height: 3.2rem;
      }
      margin-bottom: 0.1333rem;
    }
    h3 {
      padding: 0 0.2667rem;
      font-size: 0.373333rem;
      font-weight: 400;
      color: #222;
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
    }
    .AdPrice {
      margin-top: 0.1333rem;
      text-align: center;
      font-size: 0.37333rem;
      color: red;
    }
  }
}
</style>