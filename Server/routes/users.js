var express = require('express');
var router = express.Router();

var userHandle = require('../router_handle/user_handle')


// 用户注册
router.post('/register', userHandle.regUser);

// 用户登陆
router.post('/login', userHandle.login);

// 修改密码，查询用户
router.post('/selectUser', userHandle.selectUser);

// 修改密码
router.post('/recovery', userHandle.recovery);

module.exports = router;
