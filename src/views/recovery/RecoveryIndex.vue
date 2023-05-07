<template>
  <div class="recoverIndex">
    <my-header>
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="this.$router.push('/login')"
        ></i>
      </template>
      <template #title>修改密码</template>
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
          v-model="userTel"
          name="userTel"
          label="账号"
          placeholder="账号"
          :rules="[{ pattern:telRules, message: '请填写正确的手机号' }]"
        />
        <van-field
          center
          clearable
          label="验证码"
          placeholder="输入验证码"
          v-model="verify"
        >
          <template #button>
            <vue-img-verify ref="verifyRef" />
          </template>
        </van-field>
        <div style="margin: 16px;">
          <van-button
            round
            block
            color="#1baeae"
            native-type="submit"
          >下一步</van-button>
        </div>
      </van-form>
    </section>
  </div>
</template>

<script>
import myHeader from "@/components/common/myHeader.vue";
import { showFailToast,showToast } from "vant";
import { selectUser } from "@/common/https.js";
import vueImgVerify from "@/components//common/VueImageVerify.vue";
export default {
  name: "RecoveryIndex",
  data() {
    return {
      userTel: "",
      verify: "",
      imgCode: "",
      telRules: /^[1][3,4,5,7,8][0-9]{9}$/,
    };
  },
  methods: {
    onSubmit(values) {
      this.imgCode = this.$refs.verifyRef.state.imgCode || "";
      if (this.verify.toLowerCase() != this.imgCode.toLowerCase()) {
        showFailToast("验证码有误");
        return;
      }
      selectUser({
        userTel: JSON.stringify(this.userTel),
      }).then((res) => {
        if (!res.data.success) return;
        showToast({
          message: res.data.msg,
          forbidClick: true,
          duration: 1000,
        });
        
        this.$router.push({
        name: "btn",
        query:{
            key:this.userTel
        }
      });
      });
      
    },
  },
  components: {
    myHeader,
    vueImgVerify,
  },
};
</script>

<style lang="scss" scoped>
i {
  font-size: 0.5333rem;
}
</style>