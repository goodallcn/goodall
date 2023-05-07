var express = require('express');
var router = express.Router();

// 导入获取信息函数
var listHandle = require('../router_handle/index_handle')



/* GET home page. */
router.get('/api',listHandle.getData);



module.exports = router;
