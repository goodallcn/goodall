<template>
  <div class="my">
    <my-header>
      <template #back>
        <i
          class="iconfont icon-fanhui"
          @click="this.$router.back()"
        ></i>
      </template>
      <template #title>我的</template>
      <template #icons>
        <i class="iconfont icon-shenglve"></i>
      </template>
    </my-header>
    <section>
      <div class="user-info">
        <div
          class="user-login"
          v-if="!loginStatus"
        >
          <van-button
            @click="goLogin"
            color="linear-gradient(to right, #269090, #ee0a24)"
          >
            登录/注册
          </van-button>
        </div>
        <div
          class="info"
          v-else
        >
          <img
            src="https://s.yezgea02.com/1604040746310/aaaddd.png"
            alt=""
          >
          <div class="user-desc">
            <span>昵称：{{userInfo.tel}}</span>
            <span>账号：{{userInfo.tel}}</span>
            <span class="name">个性签名：xxxxx</span>
          </div>
        </div>

      </div>
      <ul class="user-list">
        <li
          v-for="(item,index) in liData"
          :key="index"
          @click="getTab(index)"
        >
          <span>{{ item.title }}</span>
          <i class="iconfont icon-youjiantou"></i>
        </li>
      </ul>
      <van-button
        plain
        hairline
        type="success"
        size="small"
        block
        v-if="loginStatus"
        @click="loginOut"
      >退出登录</van-button>
    </section>
    <Tabbar></Tabbar>
  </div>
</template>

<script>
import { showToast } from 'vant';
import { mapMutations, mapState } from "vuex";
import myHeader from "@/components/common/myHeader.vue";
import Tabbar from "@/components/common/Tabbar.vue";
import jwt_decode from "jwt-decode";
export default {
  name: "My",
  data() {
    return {
      liData: [
        { id: 1, title: "我的订单" },
        { id: 2, title: "账号管理" },
        { id: 3, title: "地址管理" },
        { id: 4, title: "关于我们" },
      ],
    };
  },
  computed: {
    ...mapState({
      loginStatus: (state) => state.user.loginStatus,
      userInfo: (state) => jwt_decode(state.user.userInfo),
    }),
  },
  methods: {
    ...mapMutations(["loginOut"]),
    goLogin() {
      this.$router.push({
        path: "/login",
      });
    },
    getTab(index) {
      switch (index) {
        case 0:
        this.$router.push("/orderList");
          break;
        case 1:
        showToast('未开放');
          break;
        case 2:
          this.$router.push("/path");
          break;
        case 3:
          this.$router.push('/aboutGoodall')
          break;
      }
    },
  },
  components: {
    Tabbar,
    myHeader,
  },
};
</script>

<style lang="scss" scoped>
.my {
  i{
    font-size: .5333rem;
  }
  section {
    .user-info {
      display: flex;
      flex-direction: column;
      width: 94%;
      margin: 0.26667rem;
      height: 3.06667rem;
      background: linear-gradient(90deg, #1baeae, #51c7c7);
      box-shadow: 0 0.05333rem 0.13333rem #269090;
      border-radius: 0.16rem;
      .user-login {
        margin: auto;
      }
      .info {
        display: flex;
        width: 100%;
        height: 100%;
        padding: 0.66667rem 0.53333rem;
        box-sizing: border-box;
        img {
          width: 1.6rem;
          height: 1.6rem;
          border-radius: 50%;
          margin-top: 0.10667rem;
        }
        .user-desc {
          display: flex;
          flex-direction: column;
          margin-left: 0.26667rem;
          line-height: 0.53333rem;
          font-size: 0.37333rem;
          color: #fff;
          span {
            line-height: 0.53333rem;
            padding: 0.0533rem 0;
          }
        }
      }
    }
    .user-list {
      padding: 0 0.53333rem;
      margin-top: 0.53333rem;
      li {
        height: 1.06667rem;
        line-height: 1.06667rem;
        display: flex;
        justify-content: space-between;
        font-size: 0.37333rem;
        border-bottom: 0.0267rem solid #f8f8f8;
        span {
          font-size: 0.37333rem;
        }
      }
    }
    .van-button--plain {
      margin-top: 0.5333rem;
    }
  }
}
</style>