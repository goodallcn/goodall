<template>
  <header>
      <div class="my-header">
        <slot name="back">
          <!-- <i
          class="iconfont icon-fanhui"
          @click="this.$router.push('/index')"
        ></i> -->
        </slot>
      
        <div>
            <slot name="title"></slot>
        </div>
        <slot name="icons"></slot>
        <!-- <i class="iconfont icon-shenglve"></i> -->
      </div>
    </header>
</template>

<script>
export default {
name:'myHeader'
}
</script>

<style lang="scss" scoped>
header {
    border-bottom: 0.0267rem solid #f8f8f8;
    padding: 0 0.2667rem;
    z-index: 999;
    .my-header {
      display: flex;
      justify-content: space-between;
      line-height: 1.2rem;
      div {
        font-size: 0.4267rem;
      }
      i {
        font-size: 0.5333rem;
      }
    }
  }
</style>