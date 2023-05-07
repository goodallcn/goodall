// 导入数据库操作模块
const db = require('../db/sql')

// 获取商品数据
exports.getGoods = function (req, res, next) {
    const sql = `select * from goods_list`
    db.query(sql, function (err, result) {
        res.send({
            code: 0,
            success: true,
            data: result
        })
    })
}

// 轮播图商品
exports.getSwipe = function (req, res, next) {
    const sql = `select * from goods_swiper`
    db.query(sql, function (err, result) {
        res.send({
            code: 0,
            success: true,
            data: result
        })
    })
}

// 火爆推荐商品
exports.getHots = function (req, res, next) {
    const sql = `select * from goods_hots`
    db.query(sql, function (err, result) {
        res.send({
            code: 0,
            success: true,
            data: result
        })
    })
}

// 新品上线商品
exports.getNews = function (req, res, next) {
    const sql = `select * from goods_news`
    db.query(sql, function (err, result) {
        res.send({
            code: 0,
            success: true,
            data: result
        })
    })
}

// 猜你喜欢商品
exports.getLikes = function (req, res, next) {
    const sql = `select * from goods_likes`
    db.query(sql, function (err, result) {
        res.send({
            code: 0,
            success: true,
            data: result
        })
    })
}

// 最新推荐商品
exports.getRecoms = function (req, res, next) {
    const sql = `select * from goods_recoms`
    db.query(sql, function (err, result) {
        res.send({
            code: 0,
            success: true,
            data: result
        })
    })
}

// 搜索商品
exports.getShoop = function (req, res, next) {
    // 前端给后端的搜索数据
    let [searchName, orderName] = Object.keys(req.query);
    let [name, order] = Object.values(req.query);
    const sql = `select * from goods_list where goods_name like "%${name}%"  order by ${orderName} ${order}`
    db.query(sql, function (error, results) {
        res.send({
            code: 200,
            data: results
        })
    })
}

// 分类标题
exports.getListTitle = function (req, res, next) {
    const sql = `select * from list_title`
    db.query(sql, function (error, results) {
        res.send({
            code: 200,
            data: results
        })
    })
}

// 分类数据
exports.getList = function (req, res, next) {
    let id = req.query.id
    const sql = `select * from goods_list where parent_id = ${id}`
    db.query(sql, function (error, results) {
        res.send({
            code: 200,
            data: results
        })
    })
}

// 商品详情数据
exports.getDetails = function (req, res, next) {
    let id = req.query.detailId
    const sql = `select * from goods_detail where detail_id = ${id}`
    db.query(sql, function (error, results) {
        res.send({
            code: 200,
            data: results
        })
    })
}