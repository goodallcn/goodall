<template>
  <div class="search-list">
    <div class="search-headers">
      <div class="headers">
        <Header>
          <template #icons>
            <i
              class="iconfont icon-fanhui icons"
              @click="this.$router.push('/search')"
            ></i>
          </template>
        </Header>
        <ul>
          <li
            v-for="(item,index) in searchList.data"
            :key="index"
            @click="changeTab(index)"
          >
            <div :class="searchList.currentIndex === index ? 'active':''">{{ item.name }}</div>
            <div
              class="search-filter"
              v-if="index !=0"
            >
              <i
                class="iconfont icon-shangjiantou"
                :class="item.status === 1 ?'active':''"
              ></i>
              <i
                class="iconfont icon-xiajiantou"
                :class="item.status === 2 ?'active':''"
              ></i>
            </div>
          </li>

        </ul>
      </div>
    </div>

    <section
      class="wrapper"
      ref="wrapper"
    >
      <list-scroll
        :scroll-data="goodList"
        v-if="goodList.length"
      >
        <div class="test1">
          <div
            class="product-item"
            v-for="(item,index) in goodList"
            :key="index"
            @click="goDetail(item.detail_id)"
          >
            <img
              :src="'../'+item.goods_img"
              alt=""
            >
            <div class="product-info">
              <p class="name">{{ item.goods_name }}</p>
              <p class="subtitle">{{ item.goods_content }}</p>
              <span>￥{{ item.goods_price }}</span>
            </div>
          </div>
        </div>
      </list-scroll>

      <div v-else>暂无相关产品</div>

    </section>
  </div>
</template>

<script>
import Header from "@/components/search/Header.vue";
import { getShoop } from "@/common/https";
// import BetterScroll from "better-scroll";
import listScroll from "@/components/common/listScroll.vue";
export default {
  name: "searchList",
  // inject: ["reload"], // 引入方法
  data() {
    return {
      goodList: [],
      searchList: {
        currentIndex: 0,
        data: [
          // status:0 都亮
          // status:1 上箭头亮
          // status:2 下箭头亮
          { name: "综合", key: "zh" },
          { name: "价格", status: 0, key: "goods_price" },
          { name: "销量", status: 0, key: "goods_num" },
        ],
      },
    };
  },
  created() {
    this.getData();
  },
  computed: {
    orderBy() {
      //知道当前是哪一个对象
      let obj = this.searchList.data[this.searchList.currentIndex];
      //针对于状态，判断是升序还是降序
      let val = obj.status == "1" ? "asc" : "desc";
      return {
        [obj.key]: val,
      };
    },
  },
  methods: {
    async getData() {
      await getShoop({
        searchName: this.$route.query.key,
        ...this.orderBy,
      }).then((res) => {
        this.goodList = res.data;
      });
      // this.$nextTick(() => {
      //   // 先渲染完图片，再加载使用滚动插件
      //   this.scroll = new BetterScroll(this.$refs.wrapper, {
      //     movable: true,
      //     zoom: true,
      //     click: true,
      //     mouseWheel: true,
      //     probeType: 3,
      //   });
      // });
    },

    changeTab(index) {
      this.searchList.currentIndex = index;
      //点击的下标对应数据的哪一个
      let item = this.searchList.data[index];
      //取消所有的状态值===》都变成0
      this.searchList.data.forEach((v, i) => {
        if (i != index) {
          v.status = 0;
        }
      });
      //当前点击的改变状态
      if (index == this.searchList.currentIndex) {
        item.status = item.status == 1 ? 2 : 1;
      }
      //发送请求进行数据排序
      this.getData();
    },
    // getData(){
    //   this.$axios({
    //     url:'/goods/searchGoods',
    //     params:{
    //       searchName: this.$route.query.key
    //     }
    //   }).then((res)=>{
    //     console.log(res);
    //   })
    // }
    goDetail(id){
      this.$router.push({
        path:'/detail',
        query:{
          id:id
        }      
      })
    }
  },
  watch: {
    $route() {
      this.getData();
      // 刷新页面，防止搜索数据过少时滑动出现问题
      // this.reload()
    },
  },
  components: {
    Header,
    listScroll,
  },
};
</script>

<style lang="scss" scoped>
.icons {
  font-size: 0.5333rem;
  color: #656771;
  font-weight: 600;
}
.search-list {
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
    background-color: #fff;
    width: 100%;
    ul {
      display: flex;
      justify-content: space-around;
      font-size: 0.4267rem;
      padding: 0.2667rem 0;
      li {
        display: flex;
        align-items: center;

        .search-filter {
          display: flex;
          flex-direction: column;
          margin-left: 0.1333rem;
          i {
            font-size: 0.32rem;
          }
        }
      }
    }
  }
  .active {
    color: red;
  }
  section {
    // .test1{
    //   padding: 1px 0;
    // }
    overflow: hidden;
    margin-top: 2.6667rem;
    .product-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      background-color: #fff;
      padding: 0.2667rem 0.2667rem;
      border-bottom: 1px solid #e9e9e9;
      img {
        width: 3.7333rem;
        height: 3.2rem;
      }
      .product-info {
        width: 56%;
        height: 3.2rem;
        margin-left: 1.0667rem;
        .name {
          font-size: 0.4rem;
          color: #333;
          margin-top: 0.2667rem;
          margin-bottom: 0.5333rem;
        }
        .subtitle {
          font-size: 0.34667rem;
          color: #999;
          margin: 0.2667rem 0;
          text-overflow: ellipsis;
          overflow: hidden;
          display: -webkit-box;
          -webkit-line-clamp: 1;
          -webkit-box-orient: vertical;
        }
        span {
          font-size: 0.4267rem;
          color: red;
        }
      }
    }
  }
}
</style>