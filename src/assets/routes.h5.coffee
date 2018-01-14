module.exports = [{

  # 首页（讨论版）
  path: '/'
  meta:
    keepAlive: true
  component: -> System.import('pages.h5/forums/:id')

},{
  # MARKS
  path: '/marks'
  meta:
    keepAlive: true
  component: -> System.import('pages.h5/marks')

},{

  # 贴子
  path: '/posts/:id'
  component: -> System.import('pages.h5/posts/:id')
  meta:
    keepAlive: true
    key:
      prefix: 'post-detail'
      params: ['id']

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

}]