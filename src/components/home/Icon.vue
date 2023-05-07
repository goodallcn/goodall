<template>
  <div class="icon-content">
    <ul>
      <li
        v-for="item in icons"
        :key="item"
        @click="iconTab"
      >
        <i :class="item.icon"></i>
        <span>{{ item.iconName }}</span>
      </li>
    </ul>
  </div>
</template>

<script>
import { showToast } from 'vant';
export default {
  name: "Icon",
  data() {
    return {
      icons: [
        {
          id: 1,
          icon: "iconfont icon-a-iconchaoshi",
          iconName: "购物中心",
        },
        {
          id: 2,
          icon: "iconfont icon-fushi",
          iconName: "创作服饰",
        },
        {
          id: 3,
          icon: "iconfont icon-feiji",
          iconName: "全球购物",
        },
        {
          id: 4,
          icon: "iconfont icon-tubiaozhizuomoban-",
          iconName: "新品上市",
        },
        {
          id: 5,
          icon: "iconfont icon-kuaidi",
          iconName: "送货上门",
        },
        {
          id: 6,
          icon: "iconfont icon-chongzhi",
          iconName: "余额充值",
        },
        {
          id: 7,
          icon: "iconfont icon-pintuangou",
          iconName: "拼团购物",
        },
        {
          id: 8,
          icon: "iconfont icon-youhuiquan",
          iconName: "优惠券",
        },
        {
          id: 9,
          icon: "iconfont icon-qianbao",
          iconName: "省钱",
        },
        {
          id: 10,
          icon: "iconfont icon-quanbufenlei",
          iconName: "全部",
        },
      ],
    };
  },
  methods:{
    iconTab(){
      showToast('未开放')
    }
  }
};
</script>

<style lang="scss" scoped>
.icon-content {
  width: 100%;
  height: 4.2667rem;
  background-color: #fff;
  ul {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    li {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      width: 2rem;
      height: 1.92rem;
      margin-top: .1333rem;

      i {
        font-size: 1rem;
        margin-bottom: .2133rem  ;

      }
      span {
        font-size: 0.32rem;
      }
    }
  }
}
.icon-a-iconchaoshi {
  color: #d87c3e;
}
.icon-fushi {
  color: #584dbd;
}
.icon-feiji {
  color: #5d5885;
}
.icon-tubiaozhizuomoban- {
  color: #2dc2a1;
}
.icon-kuaidi {
  color: #4f508b;
}
.icon-chongzhi {
  color: #da8851;
}
.icon-pintuangou {
  color: #28a04c;
}
.icon-youhuiquan {
  color: #e76629;
}
.icon-qianbao {
  color: #82991a;
}
.icon-quanbufenlei {
  color: #1b9b8a;
}
</style>