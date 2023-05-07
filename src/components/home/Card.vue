<template>
  <div class="title">
    <span>
      <slot></slot>
    </span>
  </div>
</template>

<script>
export default {
  name: "Card",
};
</script>

<style lang="scss" scoped>
.title {
  width: 100%;
  text-align: center;
  font-size: 0.48rem;
  height: 1.33333rem;
  line-height: 1.33333rem;
  color: rgb(173, 24, 19);
  span {
    position: relative;
    font-weight: 700;
  }
  span::after {
    content: "";
    display: block;
    position: absolute;
    right: -0.5rem;
    top: 50%;
    margin-top: -4px;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #d4c0a7;
  }
  span::before {
    content: "";
    display: block;
    position: absolute;
    top: 50%;
    left: -0.5rem;
    margin-top: -4px;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #d4c0a7;
  }
}
</style>