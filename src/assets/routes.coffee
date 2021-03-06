module.exports = [{

  # 注册
  path: '/register'
  meta:
    login: false
  component: -> System.import('pages/register')

},{

  # 登录
  path: '/login'
  meta:
    login: false
  component: -> System.import('pages/login')

},{

  # 重置密码
  path: '/reset-pass'
  meta:
    login: false
  component: -> System.import('pages/reset-pass')

},{

  # 个人设定
  path: '/setting'
  redirect: path: '/setting/base'
  component: -> System.import('pages/setting')
  children: [{
    path: 'base'
    meta:
      path: 'base'
      login: true
    component: -> System.import('pages/setting/base')
  },{
    path: 'pass'
    meta:
      path: 'pass'
      login: true
    component: -> System.import('pages/setting/pass')
  },{
    path: 'logout'
    meta:
      path: 'logout'
      login: true
    component: -> System.import('pages/setting/logout')
  }]

},{

  # 用户
  path: '/users/:id'
  component: -> System.import('pages/users/:id')
  children: [{
    path: ''
    meta:
      path: ''
      keepAlive: true
      key:
        prefix: 'user-detail'
        params: ['id']
    component: -> System.import('pages/users/:id/overview')
  },{
    path: 'blogs'
    meta:
      path: 'blogs'
      keepAlive: true
      key:
        prefix: 'user-detail'
        params: ['id']
    component: -> System.import('pages/users/:id/blogs')
  },{
    path: 'animes'
    meta:
      path: 'animes'
      keepAlive: true
      key:
        prefix: 'user-detail'
        params: ['id']
    component: -> System.import('pages/users/:id/animes')
  },{
    path: 'comics'
    meta:
      path: 'comics'
      keepAlive: true
      key:
        prefix: 'user-detail'
        params: ['id']
    component: -> System.import('pages/users/:id/comics')
  },{
    path: 'games'
    meta:
      path: 'games'
      keepAlive: true
      key:
        prefix: 'user-detail'
        params: ['id']
    component: -> System.import('pages/users/:id/games')
  },{
    path: 'idols'
    meta:
      path: 'idols'
      keepAlive: true
      key:
        prefix: 'user-detail'
        params: ['id']
    component: -> System.import('pages/users/:id/idols')
  },{
    path: 'fans'
    meta:
      path: 'fans'
      keepAlive: true
      key:
        prefix: 'user-detail'
        params: ['id']
    component: -> System.import('pages/users/:id/fans')
  }]

},{

  # 贴子
  path: '/posts/:id'
  component: -> System.import('pages/posts/:id')
  meta:
    keepAlive: true
    bgImage: true
    key:
      prefix: 'post-detail'
      params: ['id']
},{

  # 维基
  path: '/wiki'
  component: -> System.import('pages/wiki')

},{

  # 标记
  path: '/marks'
  meta:
    keepAlive: true
    key:
      prefix: 'marks'
  component: -> System.import('pages/marks')

},{

  # 标记
  path: '/notices'
  meta:
    keepAlive: true
    key:
      prefix: 'notices'
    login: true
  component: -> System.import('pages/notices')

},{

  # 作品
  path: '/subjects/:id'
  component: -> System.import('pages/subjects/:id')
  children: [{
    path: ''
    meta:
      path: ''
      keepAlive: true
      key:
        prefix: 'subject-detail'
        params: ['id']
    component: -> System.import('pages/subjects/:id/overview')
  },{
    path: 'world'
    meta:
      path: 'world'
      keepAlive: true
      key:
        prefix: 'subject-detail'
        params: ['id']
    component: -> System.import('pages/subjects/:id/world')
  },{
    path: 'casts'
    meta:
      path: 'casts'
      keepAlive: true
      key:
        prefix: 'subject-detail'
        params: ['id']
    component: -> System.import('pages/subjects/:id/casts')
  },{
    path: 'staffs'
    meta:
      path: 'staffs'
      keepAlive: true
      key:
        prefix: 'subject-detail'
        params: ['id']
    component: -> System.import('pages/subjects/:id/staffs')
  },{
    path: 'episodes'
    meta:
      path: 'episodes'
      keepAlive: true
      key:
        prefix: 'subject-detail'
        params: ['id']
    component: -> System.import('pages/subjects/:id/episodes')
  },{
    path: 'marks'
    meta:
      path: 'marks'
      keepAlive: true
      key:
        prefix: 'subject-detail'
        params: ['id']
    component: -> System.import('pages/subjects/:id/marks')
  }]

},{

  # 角色
  path: '/roles/:id'
  component: -> System.import('pages/roles/:id')
  children: [{
    path: ''
    meta:
      path: ''
      keepAlive: true
      key:
        prefix: 'role-detail'
        params: ['id']
    component: -> System.import('pages/roles/:id/overview')
  }]

},{

  # 人物
  path: '/persons/:id'
  component: -> System.import('pages/persons/:id')
  children: [{
    path: ''
    meta:
      path: ''
      keepAlive: true
      key:
        prefix: 'person-detail'
        params: ['id']
    component: -> System.import('pages/persons/:id/overview')
  }]

},{

  # 团体
  path: '/organizations/:id'
  component: -> System.import('pages/organizations/:id')
  children: [{
    path: ''
    meta:
      path: ''
      keepAlive: true
      key:
        prefix: 'organization-detail'
        params: ['id']
    component: -> System.import('pages/organizations/:id/overview')
  }]

},{

  # 管理
  path: '/admin'
  redirect: path: '/admin/users'
  component: -> System.import('pages/admin')
  children: [{
    path: 'users'
    meta:
      path: 'users'
      admin: true
    component: -> System.import('pages/admin/users')
  },{
    path: 'forums'
    meta:
      path: 'forums'
      admin: true
    component: -> System.import('pages/admin/forums')
  },{
    path: 'sync'
    meta:
      path: 'sync'
      admin: true
    component: -> System.import('pages/admin/sync')
  }]

},{

  # 讨论版
  path: '/forums'
  alias: '/'
  component: -> System.import('pages/forums')
  children: [{
    path: ':id'
    meta:
      keepAlive: true
      key:
        prefix: 'forum-detail'
        params: ['id']
      hideLine: true
    component: -> System.import('pages/forums/:id')
  }]

}]