import { createStore } from "vuex";

import user from './modules/user'
import cart from './modules/cart'
import path from './modules/path'
import order from './modules/order'
export default createStore({
  modules: {
    user,
    cart,
    path,
    order
  }
});
