// 导入数据库操作模块
const db = require('../db/sql')
const user = require('../db/userSql')


// 用户注册函数
exports.regUser = function (req, res, next) {
    // 接收前端的账号密码
    let params = {
        userTel: req.body.userTel,
        userPwd: req.body.userPass
    }
    //查询用户是否存在
    db.query(user.queryUserTel(params), function (error, results) {
        if (error) throw error;
        //用户存在
        if (results.length > 0) {
            res.send({
                code: 200,
                data: {
                    success: false,
                    msg: '用户已存在，请换个账号注册',
                }
            })
        } else {
            //不存在，新增一条数据
            db.query(user.inserData(params), function (err, result) {
                db.query(user.queryUserTel(params), function (e, r) {
                    res.send({
                        code: 200,
                        data: {
                            success: true,
                            msg: '注册成功',
                            r
                        }
                    })
                })
            })
        }
    })
}


// 用户登录函数
exports.login = function (req, res, next) {
    // 接收前端的账号密码
    let params = {
        userTel: req.body.userTel,
        userPwd: req.body.userPass
    }
    // 查询用户账号是否存在
    db.query(user.queryUserTel(params), function (error, results) {
        // 账号存在
        if (results.length > 0) {
            db.query(user.queryUserPwd(params), function (error, results) {
                if (results.length > 0) {
                    // 账号和密码都对
                    let tokenStr = JSON.parse(user.addToken(params))
                    res.send({
                        code: 200,
                        data: {
                            success: true,
                            msg: '登录成功',
                            data: results[0],
                            token: 'Bearer' + tokenStr
                        }
                    })
                } else {
                    // 密码不对
                    res.send({
                        code: 302,
                        data: {
                            success: false,
                            msg: '密码错误'
                        }
                    })
                }
            })
        } else {
            // 不存在
            res.send({
                code: 301,
                data: {
                    success: false,
                    msg: '账号不存在'
                }
            })
        }
    })
}

// 修改密码，查找用户是否存在
exports.selectUser = function (req, res, next) {
    // 接收前端的账号密码
    let params = {
        userTel: req.body.userTel,
    }
    // 查询用户账号是否存在
    db.query(user.queryUserTel(params), function (error, results) {
        // 账号存在
        if (results.length > 0) {
            res.send(
                {
                    data: {
                        code: 200,
                        success: true,
                        msg: '账户存在，修改密码'
                    }

                })
        } else {
            // 账户不存在
            res.send({
                data: {
                    code: 301,
                    success: false,
                    msg: '账号不存在,请输入有效账号'
                }

            })
        }

    })
}


// 修改密码
exports.recovery = function (req, res, next) {
    // 接收前端的账号密码
    let params = {
        userTel: req.body.userTel,
        userPwd: JSON.parse(req.body.userPass)
    }
    // 查询用户账号是否存在
    db.query(user.queryUserTel(params), function (error, results) {
        // 记录数id
        let id = results[0].id;
        let pwd = results[0].password
        db.query(`update user_info set password = replace(password,'${pwd}','${params.userPwd}') where id = ${id}`, function (err, result) {
            res.send({
                code: 200,
                data: {
                    success: true,
                    msg: '修改成功',
                }
            })
        })
    })
}