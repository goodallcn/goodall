import { INIT_ORDER} from './mutations-types.js'
export default {
    state: {
        list: [],
        order_id: localStorage.getItem('orderId') || '',
    },
    mutations: {
        [INIT_ORDER](state, orderId) {
            state.list = orderId
            // //存储订单号
            state.order_id = orderId[0].order_id;

            //设置一个id号
            localStorage.setItem('orderId', orderId[0].order_id);
        },

    }
}
