<template>
  <div class="login">
    <my-header>
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="this.$router.back()"
        ></i>
      </template>
      <template #title>注册</template>
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
          v-model="password"
          type="password"
          name="password"
          label="密码"
          placeholder="密码"
          :rules="[{ pattern:passRules, message: '请填写6-12位密码'  }]"
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
          <div
            class="link-register"
            @click="goLogin"
          >已有账号，前往登录</div>
          <van-button
            round
            block
            color="#1baeae"
            native-type="submit"
          >注册</van-button>
        </div>
      </van-form>
    </section>
  </div>
</template>
  
  <script>
import myHeader from "@/components/common/myHeader.vue";
import { showFailToast, showToast } from "vant";
import vueImgVerify from "@/components//common/VueImageVerify.vue";
import { register } from "@/common/https.js";
export default {
  name: "register",
  data() {
    return {
      userTel: "",
      password: "",
      verify: "",
      imgCode: "",
      telRules: /^[1][3,4,5,7,8][0-9]{9}$/,
      passRules: /^\w{6,12}$/,
    };
  },
  methods: {
    onSubmit(values) {
      this.imgCode = this.$refs.verifyRef.state.imgCode || "";
      if (this.verify.toLowerCase() != this.imgCode.toLowerCase()) {
        showFailToast("验证码有误");
        return;
      }
      register({
        userTel: JSON.stringify(this.userTel),
        userPass: JSON.stringify(this.password),
      }).then((res) => {
        let tel =  res.data.r[0].userTel;
        showToast({
          message: res.data.msg,
          forbidClick: true,
          duration: 1000,
        });
        if(!res.data.success) return
        this.$router.push({
          path:'/login',
          query:{
            key:tel
          }
        })
      });
    },
    goLogin() {
      this.$router.push({
        path: "/login",
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
.login {
  i {
    font-size: 0.5333rem;
  }
  section {
    margin-top: 0.8rem;
    padding: 0 20px;
    .link-register {
      font-size: 14px;
      margin-bottom: 20px;
      color: #1989fa;
      display: inline-block;
    }
  }
}
</style>