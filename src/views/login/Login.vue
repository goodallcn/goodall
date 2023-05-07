<template>
  <div class="login">
    <my-header>
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="this.$router.push('/index')"
        ></i>
      </template>
      <template #title>登录</template>
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
          :rules="[{ pattern:passRules, message: '请填写6-12位密码' }]"
        />
        <van-field
          center
          clearable
          label="验证码"
          placeholder="输入验证码"
          v-model="verify"
          style="margin-right: .2667rem;"
        >
          <template #button>
            <vue-img-verify  ref="verifyRef" />
          </template>
        </van-field>
        <div style="margin: 16px;">
          <div class="bFooter">
            <div
              class="link-register"
              @click="goRegister"
            >立即注册</div>
            <div
              class="link-recovery"
              @click="goRecovery"
            >找回密码</div>
          </div>

          <van-button
            round
            block
            color="#1baeae"
            native-type="submit"
          >登录</van-button>
        </div>
      </van-form>
    </section>
  </div>
</template>

<script>
import myHeader from "@/components/common/myHeader.vue";
import { showFailToast, showToast } from "vant";
import vueImgVerify from "@/components//common/VueImageVerify.vue";
import { login } from "@/common/https.js";
import { mapMutations } from "vuex";
export default {
  name: "login",

  data() {
    return {
      userTel: !this.$route.query.key ? "" : this.$route.query.key,
      password: "",
      verify: "",
      imgCode: "",
      telRules: /^[1][3,4,5,7,8][0-9]{9}$/,
      passRules: /^\w{6,12}$/,
    };
  },
  methods: {
    ...mapMutations(['userLogin']),
    onSubmit(values) {
      this.imgCode = this.$refs.verifyRef.state.imgCode || "";
      if (this.verify.toLowerCase() != this.imgCode.toLowerCase()) {
        showFailToast("验证码有误");
        return;
      }
      login({
        userTel: JSON.stringify(this.userTel),
        userPass: JSON.stringify(this.password),
      }).then((res) => {
        showToast({
          message: res.data.msg,
          forbidClick: true,
          duration: 1000,
        });
        if (!res.data.success) return;
        //登录成功 存储用户信息
        this.userLogin(res.data.token);
        this.$router.push("/my");
      });
    },
    goRegister() {
      this.$router.push({
        path: "/register",
      });
    },
    goRecovery(){
        this.$router.push({
        path: "/recovery",
      });
    }
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
    ::v-deep.van-field__body{
      justify-content: space-around;
    }
    .bFooter {
      display: flex;
      justify-content: space-between;
      margin-top: .64rem;
      .link-register {
        font-size: 14px;
        margin-bottom: 20px;
        color: #1989fa;
        display: inline-block;
      }
      .link-recovery {
        font-size: 14px;
        margin-bottom: 20px;
        color: #1989fa;
        display: inline-block;
      }
    }
  }
}
</style>