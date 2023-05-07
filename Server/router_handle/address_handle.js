// 导入数据库操作模块
const db = require('../db/sql')
let jwt_decode = require("jwt-decode");

function getTimeToken(exp) {

    let getTime = parseInt(new Date().getTime() / 1000);

    if (getTime - exp > 60) {
        return true;
    }

}


//新增地址
exports.addNews = function (req, res, next) {
    let token = req.body.token
    // 用户的账号
    let userTel = jwt_decode(token).tel
    // //拿到前端给后端传入的数据
    let body = req.body;
    let [name, tel, province, city, county, addressDetail, isDefault, areaCode] = [
        body.name,
        body.tel,
        body.province,
        body.city,
        body.county,
        body.addressDetail,
        body.isDefault,
        body.areaCode
    ];
    //查询用户
    db.query(`select * from user_info where userTel = ${userTel}`, function (error, results) {
        //用户id
        let uId = results[0].userTel;
        //增加一条收货地址
        if (isDefault != 1) {
            db.query(`insert into address (uId,name,tel,province,city,county,addressDetail,isDefault,areaCode) values (${uId},"${name}","${tel}","${province}","${city}","${county}","${addressDetail}","${isDefault}","${areaCode}")`, function (err, result) {
                res.send({
                    data: {
                        code: 200,
                        success: true,
                        msg: '收货地址添加成功'
                    }
                })
            })
        } else {
            db.query(`select * from address where uId = ${uId} and isDefault = ${isDefault}`, function (err, result) {
                if (result.length > 0) {
                    let addressId = result[0].id;
                    db.query(`update address set isDefault = replace(isDefault,'1','0') where id = ${addressId}`, function () {
                        db.query(`insert into address (uId,name,tel,province,city,county,addressDetail,isDefault,areaCode) values (${uId},"${name}","${tel}","${province}","${city}","${county}","${addressDetail}","${isDefault}","${areaCode}")`, function (e, r) {
                            res.send({
                                data: {
                                    code: 200,
                                    success: true,
                                    msg: '收货地址添加成功'
                                }
                            })
                        })
                    })
                } else {
                    db.query(`insert into address (uId,name,tel,province,city,county,addressDetail,isDefault,areaCode) values (${uId},"${name}","${tel}","${province}","${city}","${county}","${addressDetail}","${isDefault}","${areaCode}")`, function (err, result) {
                        res.send({
                            data: {
                                code: 200,
                                success: true,
                                msg: '收货地址添加成功'
                            }
                        })
                    })
                }
            })

        }
    })
}

// 获取收货地址
exports.getAddress = function (req, res, next) {
    let token = req.body.token
    // 用户的账号
    let userTel = jwt_decode(token).tel
    //如果执行，就证明token过期了
    if (getTimeToken(jwt_decode(token).exp)) return res.send({
        data: {
            code: 1000
        }
    })
    //查询用户
    db.query(`select * from user_info where usertel = ${userTel}`, function (error, results) {
        //用户账号
        let uId = results[0].userTel;
        db.query(`select *from address where uId = ${uId}`, function (err, result) {
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

// 修改收货地址
exports.updateAddress = function (req, res, next) {
    let token = req.body.token
    // 用户的账号
    let userTel = jwt_decode(token).tel
    // //拿到前端给后端传入的数据
    let body = req.body;
    let [name, tel, province, city, county, addressDetail, isDefault, areaCode, id] = [
        body.name,
        body.tel,
        body.province,
        body.city,
        body.county,
        body.addressDetail,
        body.isDefault,
        body.areaCode,
        body.id
    ];
    //查询用户
    db.query(`select * from user_info where userTel = ${userTel}`, function (error, results) {
        //用户id
        let uId = results[0].userTel;
        // 根据用户点击是否默认地址
        if (typeof isDefault !== 'undefined' && isDefault == 1) {
            // 找出原来的默认地址
            db.query(`select * from address where  isDefault = 1`, function (errs, ress) {

                if (ress.length > 0) {
                    const oldIsDefault = ress[0].isDefault
                    const oldId = ress[0].id
                    // 修改原来的默认地址
                    db.query(`update address SET isDefault = replace(isDefault,'1','0') where id = ${oldId} and isDefault = ${oldIsDefault}`, function (er, re) {
                        // 修改完原来的默认地址后，修改现在的地址
                        let updateSql = `update address set   name = ? , tel = ? , province = ? , city = ? ,county = ? , addressDetail = ? , isDefault = ? , areaCode = ? where id = ${id}`
                        db.query(updateSql, [name, tel, province, city, county, addressDetail, isDefault, areaCode], function (e, r) {
                            res.send({
                                data: {
                                    code: 200,
                                    success: true,
                                    msg: '修改成功'
                                }

                            })
                        })
                    })
                } else {
                    // 如果没有默认地址，修改现在的地址
                    let updateSql = `update address set   name = ? , tel = ? , province = ? , city = ? ,county = ? , addressDetail = ? , isDefault = ? , areaCode = ? where id = ${id}`
                    db.query(updateSql, [name, tel, province, city, county, addressDetail, isDefault, areaCode], function (e, r) {
                        res.send({
                            data: {
                                code: 200,
                                success: true,
                                msg: '修改成功'
                            }

                        })
                    })
                }
            })
        } else {
            let updateSql = `update address set   name = ? , tel = ? , province = ? , city = ? ,county = ? , addressDetail = ? , isDefault = ? , areaCode = ? where id = ${id}`
            db.query(updateSql, [name, tel, province, city, county, addressDetail, isDefault, areaCode], function (e, r) {
                res.send({
                    data: {
                        code: 200,
                        success: true,
                        msg: '修改成功'
                    }

                })
            })
        }
    })
}


// 删除收货地址
exports.deleteAddress = function (req, res, next) {
    let id = req.body.id;
    db.query(`delete from address where id = ${id}`, function (error, results) {
        res.send({
            data: {
                code: 200,
                success: true,
                msg: '删除成功'
            }
        })
    })
}