module.exports = [{

  # 时间线（首页）
  path: '/'
  meta:
    keepAlive: true
  component: -> System.import('pages/timeline')

},{

  # 注册
  path: '/register'
  component: -> System.import('pages/register')

},{

  # 登录
  path: '/login'
  component: -> System.import('pages/login')

},{

  # 用户
  path: '/users/:id'
  component: -> System.import('pages/users/:id')
  children: [{
    path: ''
    meta: path: ''
    component: -> System.import('pages/users/:id/overview')
  },{
    path: 'timeline'
    meta: path: 'timeline'
    component: -> System.import('pages/users/:id/timeline')
  },{
    path: 'blogs'
    meta: path: 'blogs'
    component: -> System.import('pages/users/:id/blogs')
  },{
    path: 'paints'
    meta: path: 'paints'
    component: -> System.import('pages/users/:id/paints')
  },{
    path: 'animes'
    meta: path: 'animes'
    component: -> System.import('pages/users/:id/animes')
  },{
    path: 'comics'
    meta: path: 'comics'
    component: -> System.import('pages/users/:id/comics')
  },{
    path: 'games'
    meta: path: 'games'
    component: -> System.import('pages/users/:id/games')
  }]

},{

  # 讨论版/acg
  path: '/acg'
  component: -> System.import('pages/acg')

},{

  # 讨论版/animes
  path: '/animes'
  component: -> System.import('pages/animes')

},{

  # 讨论版/comics
  path: '/comics'
  component: -> System.import('pages/comics')

},{

  # 讨论版/paints
  path: '/paints'
  component: -> System.import('pages/paints')

},{

  # 帖子
  path: '/posts/:id'
  component: -> System.import('pages/posts/:id')

},{
  # 维基
  path: '/wiki'
  component: -> System.import('pages/wiki')

},{

  # 作品
  path: '/subjects/:id'
  component: -> System.import('pages/subjects/:id')
  children: [{
    path: ''
    meta: path: ''
    component: -> System.import('pages/subjects/:id/overview')
  },{
    path: 'world'
    meta: path: 'world'
    component: -> System.import('pages/subjects/:id/world')
  },{
    path: 'casts'
    meta: path: 'casts'
    component: -> System.import('pages/subjects/:id/casts')
  },{
    path: 'staffs'
    meta: path: 'staffs'
    component: -> System.import('pages/subjects/:id/staffs')
  },{
    path: 'episodes'
    meta: path: 'episodes'
    component: -> System.import('pages/subjects/:id/episodes')
  }]

},{

  # 角色
  path: '/roles/:id'
  component: -> System.import('pages/roles/:id')
  children: [{
    path: ''
    meta: path: ''
    component: -> System.import('pages/roles/:id/overview')
  }]

},{

  # 人物
  path: '/persons/:id'
  component: -> System.import('pages/persons/:id')
  children: [{
    path: ''
    meta: path: ''
    component: -> System.import('pages/persons/:id/overview')
  }]

},{

  # 团体
  path: '/organizations/:id'
  component: -> System.import('pages/organizations/:id')
  children: [{
    path: ''
    meta: path: ''
    component: -> System.import('pages/organizations/:id/overview')
  }]
}]