<template>
  <div class="search-index">
    <Header>
      <template #icons>
        <i
          class="iconfont icon-fanhui icons"
          @click="this.$router.push('/index')"
        ></i>
      </template>
    </Header>
    <section>
      <div
        class="search-history"
        v-if="searchArr.length"
      >
        <span class="history">历史搜索</span>
        <i
          class="iconfont icon-shanchu"
          @click="deleteHistory"
        ></i>
        <ul>
          <li
            v-for="(item,index) in searchArr"
            :key="index"
            @click="goSearch(item)"
          >{{item}}</li>

        </ul>
      </div>
      <div v-else>暂无搜索记录</div>
    </section>
  </div>

</template>

<script>
import Header from "@/components/search/Header.vue";
import { showConfirmDialog } from "vant";
export default {
  name: "searchIndex",
  data() {
    return {
      searchArr: [],
      searchData: [],
    };
  },
  created() {
    this.searchArr = JSON.parse(localStorage.getItem("searchList")) || [];
  },
  methods: {
    goSearch(item) {
      // 点击历史记录，将点击的历史记录提升到前面
      // 获取searchList
      this.searchData = JSON.parse(localStorage.getItem("searchList"));
      // 增加数据
      this.searchData.unshift(item);
      // 去重
      let newArr = new Set(this.searchData);
      // 给本地存储赋值
      localStorage.setItem("searchList", JSON.stringify(Array.from(newArr)));
      this.$router.push({
        name: "list",
        query: {
          key: item,
        },
      });
    },
    deleteHistory() {
      showConfirmDialog({
        message: "是否删除记录",
      }).then((res) => {
        if (res == "confirm") {
          // 删除本地存储
          localStorage.removeItem("searchList");
          this.searchArr = [];
        }
      });
    },
  },
  components: {
    Header,
  },
};
</script>

<style lang="scss" scoped>
.icons {
  font-size: 0.5333rem;
  color: #656771;
  font-weight: 600;
}
.search-index {
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  section {
    position: relative;
    flex: 1;
    padding: 0.5333rem 0.2667rem;
    background-color: #f5f5f5;
    overflow: hidden;
    .search-history {
      .history {
        font-weight: 500;
        font-size: 0.4rem;
        padding: 0.1333rem;
      }
      i {
        position: absolute;
        right: 0.533rem;
        font-size: 0.4rem;
        padding: 0.1333rem;
        color: #585454;
      }
      ul {
        margin-top: 0.5333rem;
        font-size: 0.4rem;
        display: flex;
        flex-wrap: wrap;
        padding: 0 0.2667rem;
        li {
          margin: 0.2667rem;
          padding: 0.08rem 0.16rem;
          border: 1px solid #ccc;
        }
      }
    }
  }
}
</style>