// 导入数据库操作模块
const db = require('../db/sql')
let jwt_decode = require("jwt-decode");

function getTimeToken(exp) {
    let getTime = parseInt(new Date().getTime() / 1000);
    if (getTime - exp > 60) {
        return true;
    }

}

// 添加购物车数据
exports.addCarts = function (req, res, next) {
    let token = req.body['headers[token]']
    // 用户的账号
    let tel = jwt_decode(token).tel
    // 商品的独有id
    let goodsId = req.body['data[goodsId]']

    //如果执行，就证明token过期了
    if (getTimeToken(jwt_decode(token).exp)) return res.send({
        data: {
            code: 1000
        }
    })


    //查询用户
    db.query(`select * from user_info where userTel = ${tel}`, function (error, results) {
        //用户账号
        let uId = results[0].userTel;
        //查询商品
        db.query(`select * from goods_detail where detail_id=${goodsId}`, function (err, result) {
            let goodsName = result[0].goods_name;
            let goodsPrice = result[0].goods_price;
            let goodsImgUrl = result[0].img_url;
            //查询当前用户在之前是否添加过本商品
            db.query(`select * from goods_cart where uId=${uId} and goods_id=${goodsId}`, function (e, r) {
                //用户之前是添加过商品到购物车
                if (r.length > 0) {
                    let num = r[0].goods_num;
                    db.query(`update goods_cart set goods_num = replace(goods_num,${num},${parseInt(num) + 1}) where id = ${r[0].id}`, function (e, datas) {
                        res.send({
                            data: {
                                code: 200,
                                success: true,
                                msg: '添加成功'
                            }
                        })
                    })
                } else {
                    //没有
                    db.query(`insert into goods_cart (uId,goods_id,goods_name,goods_price,goods_num,goods_img) values ('${uId}','${goodsId}','${goodsName}','${goodsPrice}','1','${goodsImgUrl}')`, function () {
                        res.send({
                            data: {
                                code: 200,
                                success: true,
                                msg: '添加成功'
                            }
                        })
                    })
                }
            })
        })
    })
}

// 查询购物车数据
exports.selectCart = function (req, res, next) {
    let token = req.body['headers[token]']
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
        // 查询购物车
        db.query(`select * from goods_cart where uId= ${uId}`, function (err, result) {
            if (err) {
                console.error(err);
                res.status(500).send({
                    data: {
                        code: 500,
                        success: false,
                        message: 'Internal server error'
                    }
                });
                return;
            }
            res.send({
                data: {
                    code: 200,
                    success: true,
                    data: result
                }
            })
        })
    })
}

// 删除购物车数据
exports.deleteCart = function (req, res, next) {
    let arrId = Object.values(req.body);
    // 此代码使用 Promise.all 方法，将所有的 Promise 对象打包成一个 Promise，只有当所有 Promise 都执行成功时，才向前端发送一次成功的响应。如果有任何一个 Promise 执行失败，则返回一次失败的响应。(chatGPT解决的)
    let promises = arrId.map(id => {
        return new Promise((resolve, reject) => {
            db.query(`delete from goods_cart where id = ${id}`, function (error, results) {
                if (error) {
                    reject(error);
                } else {
                    resolve();
                }
            })
        });
    });

    Promise.all(promises).then(() => {
        res.send({
            data: {
                code: 200,
                success: true,
                msg: '删除成功',
            }
        });
    }).catch(error => {
        res.send({
            data: {
                code: 500,
                success: false,
                msg: '删除失败：' + error.message,
            }
        });
    });
}

// 修改购物车数量
exports.updateCart = function (req, res, next) {
    let id = req.body['data[id]']
    let ChangeNum = req.body['data[num]']
    db.query(`select * from goods_cart where id = ${id}`, function (error, results) {
        // 原来的数量
        let num = results[0].goods_num;
        db.query(`update goods_cart set goods_num = replace(goods_num,${num},${ChangeNum}) where id = ${id}`, function (err, result) {
            res.send({
                data: {
                    code: 200,
                    success: true,
                }
            })
        })
    })
}