<template>
  <div class="pathList">
    <my-header>
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="this.$router.push('/path')"
        ></i>
      </template>
      <template #title>
        编辑地址
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
          :address-info="AddressEditInfo"
          show-delete
          show-set-default
          :area-columns-placeholder="['请选择', '请选择', '请选择']"
          @save="onUpdate"
          @delete="onDelete"
        />

      </div>

    </section>
  </div>
</template>
  
  <script>
import myHeader from "@/components/common/myHeader.vue";
import { showConfirmDialog, showToast } from "vant";
import { updateAddress, deleteAddress } from "@/common/https";
import { areaList } from '@vant/area-data';
export default {
  data() {
    return {
      pathStatus: false,
      areaList
    };
  },
  created() {
    let key = this.$route.query.key;
    this.AddressEditInfo = JSON.parse(key);
  },
  methods: {
    onUpdate(content) {
      content.isDefault = content.isDefault == true ? 1 : 0;
      updateAddress({
        ...content,
        token: localStorage.getItem("token"),
      }).then((res) => {
        if(!res.data.success) return
        showToast({
            message: res.data.msg,
            forbidClick: true,
            duration: 1000,
          });
        this.$router.push("/path");
      });
    },
    onDelete(content) {
      showConfirmDialog({
        message: "是否删除地址",
      }).then(() => {
        deleteAddress({
          ...content,
        }).then((res) => {
          showToast({
            message: res.data.msg,
            forbidClick: true,
            duration: 1000,
          });
          this.$router.push("/path");
        });
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