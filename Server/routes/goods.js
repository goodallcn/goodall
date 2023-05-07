var express = require('express');
var router = express.Router();

// 导入获取信息函数
var goodsHandle = require('../router_handle/goods_handle')

// 获取商品数据
router.get('/goodsList', goodsHandle.getGoods);

// 获取轮播图数据
router.get('/swipe',goodsHandle.getSwipe)

// 火爆推荐商品
router.get('/hots',goodsHandle.getHots)

// 新品上线商品
router.get('/news',goodsHandle.getNews)

// 猜你喜欢商品
router.get('/likes',goodsHandle.getLikes)

// 最新推荐商品
router.get('/recoms',goodsHandle.getRecoms)

// 搜索商品
router.get('/searchGoods',goodsHandle.getShoop)

// 分类标题
router.get('/listTitle',goodsHandle.getListTitle)

// 分类数据
router.get('/lists',goodsHandle.getList)

// 商品详情
router.get('/detail',goodsHandle.getDetails)

module.exports = router;