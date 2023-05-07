/* .eslintrc.js */
module.exports = {
  root: true, // 默认是底层文件，不再向上（父文件）搜索
  env: { // 运行环境
    browser: true,
    commonjs: true,
    node: true,
    es6: true,
  },
  extends: ['plugin:vue/recommended', 'eslint:recommended'], // 规则继承，引入eslint-plugin-vue插件，并开启essential类别中的一系列规则，eslint:recommended 启用一些列核心规则
  plugins: ['vue'], // 插件【属性值可以省略包名的前缀eslint-plugin-】 eslint-plugin-vue帮助检测.vue里面的template和script代码
  parserOptions: {
    parser: 'babel-eslint', // 解析器
    sourceType: 'module', // 解析器配置文件，指定js代码来源，比如script标签引入
  },
  globals: { // 全局变量
    document,
    navigator,
    window,
  },
  rules: { /* 根据规范选择想要的规则，可官网查询相应规则https://eslint.org/docs/rules/ */
    indent: [2, 'tab'],
    'vue/script-indent': [2, 'tab', { baseIndent: 1 }],
    'vue/html-indent': [2, 'tab', { baseIndent: 1 }],
    'no-undef': 2, // 不可以有未声明的变量
    'no-redeclare': 2, // 禁止重复声明变量
    semi: [2, 'always'], // 语句强制分号结尾
    'no-func-assign': 2, // 禁止重复的函数声明
    // "spaced-comment": 2, //注释前要有空格
    'arrow-spacing': [2, { before: true, after: true }], // 箭头前后括号
    'block-spacing': [2, 'always'], // 块级作用域缩进
    'brace-style': [2, '1tbs', { allowSingleLine: true }], // 大括号风格，允许写在一行
    'comma-spacing': [2, { before: false, after: true }], // 逗号前后的空格
    'comma-style': [2, 'last'], // 逗号风格，换行时在行首还是行尾
    'eol-last': 2, // 文件以单一的换行符结束
    eqeqeq: [2, 'allow-null'], // 必须使用全等
    'generator-star-spacing': [2, { before: true, after: true }], // generate函数的前后空格
    indent: [2, 2, { SwitchCase: 1 }], // 缩进风格，switch缩进风格
    'jsx-quotes': [2, 'prefer-single'], // jsx使用单引号
    'key-spacing': [2, { beforeColon: false, afterColon: true }], // 对象字面量中冒号添加后空格
    'keyword-spacing': [2, { before: true, after: true }], // 关键字前后空格
    'new-parens': 2, // new时必须加小括号
    'no-cond-assign': 2, // 禁止在条件表达式中使用赋值语句
    'no-dupe-args': 2, // 函数参数不能重复
    'no-dupe-class-members': 2, // 对象成员不能重复
    'no-duplicate-case': 2, // switch中的case标签不能重复
    'no-empty-pattern': 2, // 禁止空解构
    'no-eval': 2, // 禁止使用eval
    'no-extra-parens': [2, 'functions'], // 禁止非必要的括号
    'no-func-assign': 2, // 禁止重复的函数声明
    'no-invalid-regexp': 2, // 禁止无效的正则表达式
    'no-irregular-whitespace': 2, // 不能有不规则的空格
    'no-mixed-spaces-and-tabs': 2, // 禁止混用tab和空格
    'no-multi-spaces': [2, { ignoreEOLComments: true }], // 不能用多余的空格
    'no-multiple-empty-lines': [2, { max: 1 }], // 空行最多不能超过2行
    'no-redeclare': 2, // 禁止重复声明变量
    'no-regex-spaces': 2, // 禁止在正则表达式字面量中使用多个空格
    'no-trailing-spaces': 2, // 一行结束后面不要有空格
    'no-undef': 2, // 不能有未定义的变量
    'no-whitespace-before-property': 2, // 对象键之前无空格
    'operator-linebreak': [2, 'after', { overrides: { '?': 'before', ':': 'before' } }], // 换行时运算符在行尾还是行首
    'padded-blocks': [2, 'never'], // 块语句内行首行尾不能空行
    'semi-spacing': [2, { before: false, after: true }], // 分号前后空格
    'space-before-blocks': [2, 'always'], // 不以新行开始的块{前面需要有空格
    // "space-before-function-paren": [2, "always"], //函数定义时括号前面需要有空格
    'space-in-parens': [2, 'never'], // 小括号里面不需要有空格
    'space-infix-ops': 2, // 中缀操作符周围需要有空格
    'space-unary-ops': [2, { words: true, nonwords: false }], // 一元运算符的前/后要不要加空格
    'spaced-comment': [
      2,
      'always',
      { markers: ['global', 'globals', 'eslint', 'eslint-disable', '*package', '!', ','] },
    ], // 注释风格需要有空格
    'template-curly-spacing': [2, 'never'], // 模板中{}包裹的变量不需要空格
    'wrap-iife': [2, 'any'], // 立即执行函数表达式的小括号风格任意一种都可以
    'yield-star-spacing': [2, 'both'], // generate 函数 yeild风格
    // "prefer-const": 2, //优先使用const
    'object-curly-spacing': [2, 'always', { objectsInObjects: false }], // 大括号内是否允许不必要的空格
  },
};
