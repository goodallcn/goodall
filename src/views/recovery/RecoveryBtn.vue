<template>
  <div class="recoverIndex">
    <my-header>
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="this.$router.back()"
        ></i>
      </template>
      <template #title></template>
      <template #icons>
        <i
          class="iconfont icon-shenglve"
          @click="this.$router.push('/index')"
        ></i>
      </template>
    </my-header>
    <section>
      <van-form @submit="onSubmit">
        <van-field
          v-model="password"
          type="password"
          name="password"
          label="密码"
          placeholder="密码"
          :rules="[{ pattern:passRules, message: '请填写6-12位密码' }]"
        />

        <div style="margin: 16px;">
          <van-button
            round
            block
            color="#1baeae"
            native-type="submit"
          >确认修改</van-button>
        </div>
        {{ userTel }}
      </van-form>
    </section>
  </div>
</template>
  
  <script>
import myHeader from "@/components/common/myHeader.vue";
import { showToast } from "vant";
import { recovery } from "@/common/https.js";
export default {
  name: "RecoveryBtn",
  data() {
    return {
      userTel: "",
      password: "",
      passRules: /^\w{6,12}$/,
    };
  },
  methods: {
    onSubmit(values) {
      recovery({
        userTel: JSON.stringify(this.$route.query.key),
        userPass: JSON.stringify(this.password),
      }).then((res) => {
        showToast({
          message: res.data.msg,
          forbidClick: true,
          duration: 1000,
        });
        this.$router.push({
          path: "/login",
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
i {
  font-size: 0.5333rem;
}
</style>