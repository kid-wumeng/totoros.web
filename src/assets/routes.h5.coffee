module.exports = [{

  # MARKS
  path: '/marks'
  meta:
    keepAlive: true
    bgColor: true
  component: -> System.import('pages.h5/marks')

},{

  # 注册
  path: '/register'
  meta:
    login: false
  component: -> System.import('pages.h5/register')

},{

  # 登录
  path: '/login'
  meta:
    login: false
  component: -> System.import('pages.h5/login')

},{

  # 退出登录
  path: '/logout'
  meta:
    login: true
  component: -> System.import('pages.h5/logout')

},{

  # 贴子
  path: '/posts/:id'
  component: -> System.import('pages.h5/posts/:id')
  meta:
    keepAlive: true
    key:
      prefix: 'post-detail'
      params: ['id']
    bgColor: true

},{

  # 用户
  path: '/users/:id'
  component: -> System.import('pages.h5/users/:id')
  meta:
    keepAlive: true
    key:
      prefix: 'user-detail'
      params: ['id']

},{

  # 作品
  path: '/subjects/:id'
  component: -> System.import('pages.h5/subjects/:id')
  meta:
    keepAlive: true
    key:
      prefix: 'subject-detail'
      params: ['id']

},{

  # 角色
  path: '/roles/:id'
  component: -> System.import('pages.h5/roles/:id')
  meta:
    keepAlive: true
    key:
      prefix: 'role-detail'
      params: ['id']

},{

  # 人物
  path: '/persons/:id'
  component: -> System.import('pages.h5/persons/:id')
  meta:
    keepAlive: true
    key:
      prefix: 'person-detail'
      params: ['id']

},{

  # 团体
  path: '/organizations/:id'
  component: -> System.import('pages.h5/organizations/:id')
  meta:
    keepAlive: true
    key:
      prefix: 'organization-detail'
      params: ['id']

},{

  # 讨论版
  path: '/forums'
  alias: '/'
  component: -> System.import('pages.h5/forums')
  children: [{
    path: ':id'
    meta:
      keepAlive: true
      key:
        prefix: 'forum-detail'
        params: ['id']
      bgColor: true
    component: -> System.import('pages.h5/forums/:id')
  }]

}]