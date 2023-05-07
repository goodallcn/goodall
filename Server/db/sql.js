// 导入数据库组件
const mysql = require('mysql')

const db = mysql.createPool({
    host:'127.0.0.1',
    user:'root',
    password:'123456',
    database:'calligraphy_sql'
})

module.exports = db