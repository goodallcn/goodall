// 验证数据库中用户相关内容
const User = {
    // 查询手机号
    queryUserTel(option){
        return `select * from user_info where userTel = ${option.userTel}`
    },
    // 查询密码
    queryUserPwd(option){
        return `select * from user_info where (userTel = ${option.userTel}) and password = ${option.userPwd}`

    },
    // 新增用户
    inserData( option ){
		let userTel = JSON.parse(option.userTel) ;
		let userPwd = JSON.parse(option.userPwd) ;

		return 'insert into user_info (userTel,password) values ("'+userTel+'","'+userPwd+'")';
	},
    // 登录生成token
    addToken(option){
        let userTel = JSON.parse(option.userTel) ;
         // 引入token包
         let jwt = require('jsonwebtoken');
         // 用户信息
         let payload = {tel:userTel}
         // 口令
         let secret = 'goodall'
         // 生成token
         let token = JSON.stringify(jwt.sign(payload,secret,{ expiresIn: '2h' })) 

         return token
    },
     
}

exports = module.exports = User