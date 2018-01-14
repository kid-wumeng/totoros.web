module.exports = [{

  # 首页（论坛列表）
  path: '/'
  meta:
    keepAlive: true
  component: -> System.import('pages.h5/forums/:id')

},{

  # 贴子
  path: '/posts/:id'
  component: -> System.import('pages.h5/posts/:id')
  meta:
    keepAlive: true
    key:
      prefix: 'post-detail'
      params: ['id']

}]