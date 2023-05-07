var express = require('express');
var router = express.Router();

// 导入获取信息函数
var orderHandle = require('../router_handle/order_handle')


// 生成订单
router.post('/addOrder',orderHandle.addOrder)

// 查询订单
router.post('/selectOrder',orderHandle.selectOrder)

// 提交订单
router.post('/submitOrder',orderHandle.submitOrder)

// 获取订单
router.post('/getOrder',orderHandle.getOrder)

// 订单详情
router.post('/orderDetail',orderHandle.orderDetail)

// 修改订单状态
router.post('/changeOrder',orderHandle.changeOrder)

// 删除订单
router.post('/deleteOrder',orderHandle.deleteOrder)

module.exports = router;