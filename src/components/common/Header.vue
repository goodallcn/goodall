<template>
  <header>
    <div class="menu"  @click="goList">
      <i class="iconfont icon-caidan"></i>
    </div>
    <div class="search">
      <span class="search-name">书法用品</span>
      <div class="search-content" @click="goSearch">
        <i class="iconfont icon-fangdajing"></i>
        <span>飘若浮云,矫若惊龙</span>
      </div>
    </div>
    <div class="my" @click="goMy">
      <i class="iconfont icon-shouye1"></i>
    </div>
  </header>
</template>

<script>
export default {
  name: "Header",
  methods:{
    goList(){
        this.$router.push('/list')
    },
    goMy(){
        this.$router.push('/my')
    },
    goSearch(){
      this.$router.push('/search')
    }
  }
};
</script>

<style lang="scss" scoped>
header {
  display: flex;
  justify-content: space-between;
  width: 100%;
  line-height: 1.3333rem;
  background-color: #1baeae;
  z-index: 999;
  font-size: 0.4rem;
  color: #fff;
  .menu {
    padding-left: 0.4rem;
    i {
      font-size: 0.5333rem;
    }
  }
  .search {
    display: flex;
    width: 74%;
    height: 0.53333rem;
    line-height: 0.53333rem;
    margin: 0.26667rem 0;
    padding: 0.13333rem 0;
    color: #232326;
    background: hsla(0, 0%, 100%, 0.7);
    border-radius: 0.53333rem;
    .search-name {
      padding: 0 0.26667rem;
      color: #1baeae;
      font-size: 0.53333rem;
      font-weight: 700;
      border-right: 0.02667rem solid #666;
    }
    .search-content {
      margin-left: 0.6rem;
      color: #666;
      i{
        font-size: .4267rem;
      }
      span {
        margin-left: 0.1333rem;
        font-size: 0.32rem;
      }
    }
  }
  .my {
    padding-right: 0.4rem;
    i {
      font-size: 0.5333rem;
    }
  }
}
</style>