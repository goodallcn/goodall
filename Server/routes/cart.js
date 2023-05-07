var express = require('express');
var router = express.Router();

// 导入获取信息函数
var cartHandle = require('../router_handle/cart_handle')


// 加入购物车
router.post('/addCart',cartHandle.addCarts)

// 查询购物车
router.post('/selectCart',cartHandle.selectCart)

// 查询购物车
router.post('/deleteCart',cartHandle.deleteCart)

// 修改购物车数量
router.post('/updateCart',cartHandle.updateCart)

module.exports = router;