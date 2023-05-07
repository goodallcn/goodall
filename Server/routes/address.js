var express = require('express');
var router = express.Router();

// 导入获取信息函数
var addressHandle = require('../router_handle/address_handle')

// 新增地址
router.post('/addNews', addressHandle.addNews)

// 获取收货地址
router.post('/getAddress', addressHandle.getAddress)

// 修改收货地址
router.post('/updateAddress', addressHandle.updateAddress)

// 删除收货地址
router.post('/deleteAddress', addressHandle.deleteAddress)

module.exports = router;