<template>
  <div id="app">
    <router-view v-slot="{ Component }" v-if="isRouterAlive">
    <keep-alive>
      <component :is="Component" v-if="$route.meta.keepAlive" :key="$route.name"></component>
    </keep-alive>
    <component :is="Component" v-if="!$route.meta.keepAlive" :key="$route.name">></component>
  </router-view>
  </div>
</template>

<script>
export default {
  name: "App",
  provide() {
    // 注册一个方法
    return {
      reload: this.reload,
    };
  },
  data() {
    return {
      isRouterAlive: true,
    };
  },
  created(){
    this.$store.commit('initUser')
  },
  methods: {
    reload() {
      this.isRouterAlive = false;
      this.$nextTick(function () {
        this.isRouterAlive = true;
        console.log('reload');
      });

    },
  },
};
</script>

<style lang="scss">
</style>
