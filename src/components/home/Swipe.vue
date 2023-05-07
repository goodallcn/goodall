<template>
  <div class="swipe">
    <van-swipe
      class="my-swipe"
      :autoplay="3000"
      indicator-color="white"
      lazy-render
    >
      <van-swipe-item
        v-for="item in images"
        :key="item"
      >
        <img
          :src="item.img"
          alt=""
        >
      </van-swipe-item>

    </van-swipe>
  </div>
</template>

<script>
import { getSwipe } from "@/common/https";
export default {
  name: "Swipe",
  data() {
    return {
      images: [],
    };
  },
  created(){
    this.getSwiper()
  },
  methods:{
    async getSwiper(){
      await getSwipe().then(res=>{
        this.images = res.data
      })
    }
  }
};
</script>

<style lang="scss" scoped>
.swipe {
  width: 100%;
  height: 4.4rem;
  bottom: 0;
  margin-top: 1.3333rem;
  .my-swipe .van-swipe-item {
    color: #fff;
    font-size: 20px;
    text-align: center;
    img {
      width: 100%;
      height: 4.4rem;
    }
  }
}
</style>