// 导入数据库操作模块
const db = require('../db/sql')
let jwt_decode = require("jwt-decode");

function getTimeToken(exp) {
    let getTime = parseInt(new Date().getTime() / 1000);
    if (getTime - exp > 60) {
        return true;
    }

}

//生成订单
exports.addOrder = function (req, res, next) {
    let token = req.body.token
    // 用户的账号
    let userTel = jwt_decode(token).tel
    let goodsArr = JSON.parse(req.body.arr)
     // 商品ID
     let shopArr = JSON.parse(req.body.shopArr)
    //生成订单号order_id，规则：时间戳 + 6为随机数
    function setTimeDateFmt(s) {
        return s < 10 ? '0' + s : s
    }
    function randomNumber() {
        const now = new Date();
        let month = now.getMonth() + 1;
        let day = now.getDate();
        let hour = now.getHours();
        let minutes = now.getMinutes();
        let seconds = now.getSeconds();
        month = setTimeDateFmt(month);
        day = setTimeDateFmt(day);
        hour = setTimeDateFmt(hour);
        minutes = setTimeDateFmt(minutes);
        seconds = setTimeDateFmt(seconds);
        let orderCode = now.getFullYear().toString() + month.toString() + day + hour + minutes + seconds + (Math.round(Math.random() * 1000000)).toString();
        return orderCode;
    }
    //商品列表名称
    let goodsName = [];
    //订单商品总金额
    let goodsPrice = 0;
    //订单商品总数量
    let goodsNum = 0;
    //订单号
    let orderId = randomNumber();
    goodsArr.forEach(v => {
        goodsName.push(v.goods_name);
        goodsPrice += v.goods_price * v.goods_num;
        goodsNum += parseInt(v.goods_num);
    })
    //查询当前用户
    db.query(`select * from user_info where userTel = ${userTel}`, function (error, results) {
        //用户id
        let uId = results[0].userTel;
        db.query(`insert into goods_order (order_id,goods_name,goods_price,goods_num,order_status,uId) values ('${orderId}','${goodsName}','${goodsPrice.toFixed(2)}','${goodsNum}','1',${uId})`, function () {
            db.query(`select * from goods_order where uId = ${uId} and order_id='${orderId}'`, function (err, result) {
                //购物车数据删除
                shopArr.forEach(v => {
                    db.query(`delete from goods_cart where id = ${v}`, function () {
                    })
                })
                res.send({
                    data: {
                        success: true,
                        code: 200,
                        data: result
                    }
                })
            })
        })
    })
}

// 查询订单
exports.selectOrder = function (req, res, next) {
    // 订单号
    let orderId = req.body.orderId
   
    db.query(`select * from goods_order where order_id='${orderId}'`, function (err, result) {
        res.send({
            data: {
                success: true,
                code: 200,
                data: result
            }
        })
    })
}

// 提交订单
exports.submitOrder = function (req, res, next) {
    // 订单号
    let orderId = req.body.orderId
   
    // let arr = JOSN.parse(shopArr)
    let token = req.body.token
    // 用户的账号
    let userTel = jwt_decode(token).tel

    //查询用户
    db.query(`select * from user_info where userTel = ${userTel}`, function (error, results) {
        //用户id
        let uId = results[0].userTel;
        db.query(`select * from goods_order where uId = ${uId} and order_id = ${orderId}`, function (err, result) {
            //订单的数据库id
            let id = result[0].id;

            //修改订单状态 1==>2
            db.query(`update goods_order set order_status = replace(order_status,'1','2') where id = ${id}`, function (e, r) {
                
                res.send({
                    data: {
                        code: 200,
                        success: true,
                        msg: '支付成功'
                    }
                })
            })
        })
    })
}

// 获取订单
exports.getOrder = function (req, res, next) {
    let token = req.body.token
    // 用户的账号
    let tel = jwt_decode(token).tel
     //如果执行，就证明token过期了
     if (getTimeToken(jwt_decode(token).exp)) return res.send({
        data: {
            code: 1000
        }
    })
    //查询用户
    db.query(`select * from user_info where userTel = ${tel}`, function (error, results) {
        if (error) {
            console.error(error);
            res.status(500).send({
                data: {
                    code: 500,
                    success: false,
                    message: 'Internal server error'
                }
            });
            return;
        }
        //用户账号
        let uId = results[0].userTel;
        db.query(`select * from goods_order where uId='${uId}'  ORDER BY create_time DESC`, function (err, result) {
            res.send({
                data: {
                    success: true,
                    code: 200,
                    data: result
                }
            })
        })

    }
    )
}

// 获取订单详情
exports.orderDetail = function (req, res, next) {
    let id = req.body.id
    db.query(`select * from goods_order where id='${id}'`, function (err, result) {
        res.send({
            data: {
                success: true,
                code: 200,
                data: result
            }
        })
    })
}

// 修改订单状态
exports.changeOrder = function (req, res, next) {
    let id = req.body.id
    console.log(id);
    db.query(`update goods_order set order_status = replace(order_status,'1','2') where id = ${id}`, function (err, result) {
        res.send({
            data: {
                success: true,
                code: 200,
                msg:'支付成功'
            }
        })
    })
}

// 删除订单
exports.deleteOrder = function (req, res, next) {
    let id = req.body.id
    db.query(`delete from goods_order where id = ?`, [id], function (err, result) {
        res.send({
            data: {
                success: true,
                code: 200,
                msg: '删除成功'
            }
        })
    })
}

