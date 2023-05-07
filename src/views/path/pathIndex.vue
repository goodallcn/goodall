<template>
  <div class="path-index">

    <my-header>
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="$router[pathStatus ? 'back' : 'push']('/my')"
        ></i>
      </template>
      <template #title>地址管理</template>
      <template #icons>
        <i
          class="iconfont icon-shenglve"
          @click="this.$router.push('/my')"

        ></i>
      </template>
    </my-header>
    <section>
      <list-scroll>
        <div class="address">
          <van-address-list
            :list="list"
            default-tag-text="默认"
            @edit="onEdit"
            @click-item="selectAdd"
          />
        </div>
      </list-scroll>
    </section>
    <footer>
      <van-button
        type="success"
        @click="onAdd"
      >添加地址</van-button>
    </footer>
  </div>
</template>
  
<script>
import myHeader from "@/components/common/myHeader.vue";
import { showToast } from "vant";
import { getAddress } from "@/common/https";
import { mapState, mapMutations } from "vuex";
import listScroll from "@/components/common/listScroll.vue";
import bus from "@/bus";
export default {
  name: "pathIndex",
  data() {
    return {
      pathStatus: false,
    };
  },
  created() {
    // 从订单页面进来
    if (this.$route.query.type == "select") {
      this.pathStatus = true;
    }

    this.getData();
  },
  computed: {
    ...mapState({
      list: (state) =>
        state.path.list.map((item) => {
          return {
            id: item.id,
            name: item.name,
            tel: item.tel,
            address: `${item.province} ${item.city} ${item.county} ${item.addressDetail}`,
            isDefault: item.isDefault == 1 ? true : "",
            province: item.province,
            city: item.city,
            county: item.county,
            addressDetail: item.addressDetail,
          };
        }),
    }),
  },
  methods: {
    ...mapMutations(["initData"]),
    getData() {
      getAddress({
        token: localStorage.getItem("token"),
      }).then((res) => {
        this.initData(res.data.data);
      });
    },

    onAdd() {
      this.$router.push({
        name: "pathList",
      });
    },
    selectAdd(item) {
      // 如果this.pathStatus = true 代表从订单页面进入选择状态
      if (this.pathStatus) {
        bus.$emit("selectPath", JSON.stringify(item));
        this.$router.back();
        return;
      }
    },
    onEdit(item, index) {
      this.$router.push({
        name: "pathEdit",
        query: {
          key: JSON.stringify(item),
        },
      });
      showToast("编辑地址:" + index);
    },
  },
  components: {
    myHeader,
    listScroll,
  },
};
</script>
  
  <style lang="scss" scoped>
.path-index {
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  i {
    font-size: 0.5333rem;
  }

  section {
    overflow: hidden;
    .address {
      ::v-deep .van-radio__icon {
        display: none;
      }
      ::v-deep .van-address-list__bottom {
        display: none;
      }
      ::v-deep .van-tag--primary {
        background-color: red;
      }
    }
  }
  footer {
    text-align: center;

    .van-button--success {
      width: 8rem;
      height: 1.06667rem;
      font-weight: 500;
      border: none;
      background: #1baeae;
      border-radius: 26.64rem;
      padding: 0 0.4rem;
      font-size: 0.37333rem;
    }
  }
}
</style>