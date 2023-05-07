import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

// 引入bus.js组件
// import Bus from './bus.js'

// vant组件
import { Button } from 'vant';
import { Swipe, SwipeItem } from 'vant';
import { Loading } from 'vant';
import { Dialog } from 'vant';
import { Lazyload } from 'vant';
import { ActionBar, ActionBarIcon, ActionBarButton } from 'vant';
import { Form, Field, CellGroup } from 'vant';
import { SwipeCell } from 'vant';
import { Checkbox, CheckboxGroup } from 'vant';
import { Stepper } from 'vant';
import { AddressList } from 'vant';
import { AddressEdit } from 'vant';
import { Tab, Tabs } from 'vant';
import { Card } from 'vant';
import { List } from 'vant';
import { Divider } from 'vant';

// 解决移动端300毫秒点击延迟问题
import FastClick from "fastclick";
if ('addEventListener' in document && 'ontouchstart' in window) {
    FastClick.prototype.focus = function (targetElement) {
      targetElement.focus()
    }
    document.addEventListener('DOMContentLoaded', function () {
      FastClick.attach(document.body)
    }, false)
  }

//引入组件样式
import 'vant/lib/index.css';

// 淘宝无线适配文件
import '@/assets/js/flexible'

// 引入字体图标
import '@/assets/css/iconfont.css'

import axios from "@/common/api";



const app = createApp(App)
axios.defaults.headers['Content-Type'] = 'application/x-www-form-urlencoded'
// axios.defaults.headers['Content-Type'] = 'application/x-www-form-urlencoded'
axios.defaults.baseURL = 'http://localhost:3007'
app.config.globalProperties.$axios = axios
app.use(store)
app.use(router)
app.use(Button);
app.use(Swipe);
app.use(SwipeItem);
app.use(Loading);
app.use(Dialog);
app.use(Lazyload);
app.use(ActionBar);
app.use(ActionBarIcon);
app.use(ActionBarButton);
app.use(Form);
app.use(Field);
app.use(CellGroup);
app.use(SwipeCell);
app.use(Checkbox);
app.use(CheckboxGroup);
app.use(Stepper);
app.use(AddressList);
app.use(AddressEdit);
app.use(Tab);
app.use(Tabs);
app.use(Card);
app.use(List);
app.use(Divider);
app.mount("#app");


