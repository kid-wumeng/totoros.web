module.exports = [{
  # 时间线（首页）
  path: '/'
  component: -> System.import('pages/timeline')
},{
  # 注册
  path: '/register'
  component: -> System.import('pages/register')
},{
  # 登录
  path: '/login'
  component: -> System.import('pages/login')
}]