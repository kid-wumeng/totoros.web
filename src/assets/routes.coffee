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
  # 维基
  path: '/wiki'
  component: -> System.import('pages/wiki')
},{
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
}]