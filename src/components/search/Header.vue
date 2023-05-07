<template>
  <header>
    <div class="search-header">
        <!-- <i
          class="iconfont icon-fanhui"
          @click="this.$router.push('/index')"
        ></i> -->
      <slot name="icons"></slot>
      <div class="search-main">
        <i class="iconfont icon-fangdajing"></i>
        <form
          action=""
          onsubmit="return false"
          @keyup.enter="goSearchList"
        >
          <input
            type="search"
            placeholder="搜索你喜欢的产品"
            style="color: #666"
            v-model="searchVal"
          >
        </form>
      </div>
      <span
        class='search-btn'
        @click="goSearchList"
      >搜索</span>
    </div>
  </header>
</template>

<script>
export default {
  name: "searchHeader",
  data() {
    return {
      searchVal: this.$route.query.key || "",
      searchArr: [],
      searchHis: "",
    };
  },

  mounted() {
    if (!this.$route.query.key) return;
    this.searchHis == this.$route.query.key;
    if (!this.searchHis) return;
    this.searchVal == this.searchHis;
  },

  methods: {
    goSearchList() {
      // 搜索框空白直接返回
      if (!this.searchVal) return;
      // 判断之前有没有本地存储
      if (!localStorage.getItem("searchList")) {
        // 没有
        localStorage.setItem("searchList", "[]");
      } else {
        // 有
        this.searchArr = JSON.parse(localStorage.getItem("searchList"));
      }
      // 增加数据
      this.searchArr.unshift(this.searchVal);
      // 去重
      let newArr = new Set(this.searchArr);
      // 给本地存储赋值
      localStorage.setItem("searchList", JSON.stringify(Array.from(newArr)));
      // 路径如果没有变化，不跳转页面
      if (this.searchVal === this.$route.query.key) return;
      this.$router.push({
        name: "list",
        query: {
          key: this.searchVal,
        },
      });
    },
  },
};
</script>

<style lang="scss" scoped>
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
      width: 6.1333rem;
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
    .search-btn {
      width: 1.0667rem;
      line-height: 0.7467rem;
      font-size: 0.4rem;
      background: #1baeae;
      color: #fff;
      text-align: center;
      border-radius: 0.2667rem;
    }
  }
}
</style>