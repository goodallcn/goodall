<template>
  <div class="pathList">
    <my-header>
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="this.$router.back()"
        ></i>
      </template>
      <template #title>
        添加地址
      </template>
      <template #icons>
        <i
          class="iconfont icon-shenglve"
          @click="this.$router.push('/my')"
        ></i>
      </template>
    </my-header>
    <section>
      <div class="selectPath">
        <van-address-edit
          :area-list="areaList"
          show-set-default
          :area-columns-placeholder="['请选择', '请选择', '请选择']"
          @save="onAdd"
        />
      </div>

    </section>
  </div>
</template>

<script>
import myHeader from "@/components/common/myHeader.vue";
import { showToast } from "vant";
import { addNews } from "@/common/https";
import { areaList } from '@vant/area-data';
export default {
  data() {
    return {
      pathStatus: false,
      areaList
    };
  },

  methods: {
    onAdd(content) {
      content.isDefault = content.isDefault == true ? 1 : 0;
      addNews({
        ...content,
        token: localStorage.getItem("token"),
      }).then((res) => {
        if (!res.data.success) return;
        showToast("添加成功");
        this.$router.back();
      });
    },
  },
  components: {
    myHeader,
  },
};
</script>

<style lang="scss" scoped>
.pathList {
  i {
    font-size: 0.5333rem;
  }
}
</style>