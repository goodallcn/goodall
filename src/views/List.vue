<template>
  <div class="list">
    <header>
      <div class="search-header">
        <i
          class="iconfont icon-fanhui"
          @click="goHome"
        ></i>
        <div class="search-main">
          <i class="iconfont icon-fangdajing"></i>
          <input
            type="search"
            placeholder="全场20元起"
            style="color: #666"
            @click="goSearch"
          >
        </div>
      </div>
    </header>
    <section>
      <div class="list-l">
        <list-scroll :scroll-data="listTitle">
          <ul>
            <li
              v-for="(item,index) in listTitle"
              :key="item.id"
              :class="{active:index == currentIndex}"
              @click="changeTab(index)"
            >{{ item.name }}</li>
          </ul>
        </list-scroll>

      </div>
      <div class="list-r">
        <list-scroll :scroll-data="lists">
          <div class="category-list">
            <div
              class="product-item"
              v-for="(item,index) in lists"
              :key="index"
              @click="goDetail(item.detail_id)"
            >
              <img
                v-lazy="item.goods_img"
                alt=""
              >
              <p class="product-title">{{item.goods_name}}</p>
            </div>
          </div>
        </list-scroll>
      </div>
    </section>
    <Tabbar></Tabbar>
  </div>

</template>
  
  <script>
import Tabbar from "@/components/common/Tabbar.vue";
// import BetterScroll from "better-scroll";
import listScroll from "@/components/common/listScroll.vue";
import { getListTitle, getLists } from "@/common/https";
export default {
  name: "List",
  inject: ["reload"], // 引入方法
  data() {
    return {
      listTitle: [],
      lists: [],
      currentIndex: 0,
    };
  },
  created() {
    this.getTitle();
  },
  methods: {
    async getTitle() {
      var res = await getListTitle();
      this.listTitle = res.data;
      getLists({
        // 将标签序号传给后端
        id: this.listTitle[this.currentIndex].id,
      }).then((result) => {
        this.lists = result.data;
        // 当dom加载完毕再去执行
        // this.$nextTick(() => {
        //   // 先渲染完图片，再加载使用滚动插件
        //   // 左侧滑动
        //   new BetterScroll(this.$refs.left, { click: true });

        //   //  右侧滑动
        //   this.rightBScroll = new BetterScroll(this.$refs.right, {
        //     click: true,
        //     probeType: 3,
        //     bounce: false,
        //   });
        // });
      });
    },
    // 点击li标签
    changeTab(index) {
      this.currentIndex = index;
      getLists({
        id: this.listTitle[index].id,
      }).then((result) => {
        this.lists = result.data;
        // 当dom加载完毕再去执行
        //  this.$nextTick(() => {
        //     // 先渲染完图片，再加载使用滚动插件
        //     // 左侧滑动
        //     new BetterScroll(this.$refs.left, { click: true });

        //     //  右侧滑动
        //     this.rightBScroll = new BetterScroll(this.$refs.right, {
        //       click: true,
        //       probeType: 3,

        //     });
        //   });
      });
    },
    goHome() {
      this.$router.push("/index");
    },
    goSearch() {
      this.$router.push("/search");
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
    Tabbar,
    listScroll,
  },
};
</script>
  
<style lang="scss" scoped>
.list {
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  header {
    .search-header {
      display: flex;
      justify-content: space-around;
      align-items: center;
      line-height: 1.3333rem;
      i {
        font-size: 0.5333rem;
        color: #656771;
        font-weight: 600;
      }
      .search-main {
        display: flex;
        width: 7.2rem;
        line-height: 0.8rem;
        border-radius: 0.53333rem;
        background-color: #f7f7f7;
        padding: 0 0.2667rem;
        i {
          font-size: 0.4267rem;
          margin-left: 0.2667rem;
        }
        input {
          width: 90%;
          margin-left: 0.5333rem;
          font-size: 0.4267rem;
          color: #666;
          background: #f7f7f7;
          border: 0;
        }
      }
    }
  }
  section {
    display: flex;
    justify-content: space-between;
    width: 100%;
    overflow: hidden;
    margin-bottom: 1.3333rem;
    .list-l {
      width: 2.8rem;
      overflow: hidden;
      ul {
        li {
          width: 100%;
          height: 1.49333rem;
          text-align: center;
          line-height: 1.49333rem;
          font-size: 0.37333rem;
          &.active {
            color: #b54f4a;
          }
        }
      }
    }
    .list-r {
      width: 72%;
      padding: 0.2667rem;
      box-sizing: border-box;
      .category-list {
        display: flex;
        flex-wrap: wrap;
        .product-item {
          width: 50%;
          text-align: center;
          font-size: 0.4rem;
          display: flex;
          flex-direction: column;
          img {
            width: 1.8667rem;
            height: 1.8667rem;
            margin: 0.4rem auto;
          }
          .product-title {
            margin: 0.26667rem 0;
          }
        }
      }
    }
  }
}
</style>