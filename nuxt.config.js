module.exports =
{
   build: {
      extend (config, ctx) {
         config.module.rules.push({
            test: /\.coffee$/,
            loader: 'coffee-loader'
         })
         config.resolve.extensions.push('.coffee')
      }
   },

   head: {
      titleTemplate (chunk) {
         return chunk ? `${chunk} - totoros` : 'totoros'
      },

      meta: [{
         charset: 'utf-8'
      },{
         name:    'viewport',
         content: 'width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no'
      },{
         hid:     'keywords',
         name:    'keywords',
         content: '硬核漫画, 青年漫画, 小众漫画, 冷门漫画'
      },{
         hid:     'description',
         name:    'description',
         content: '硬核漫画, 青年漫画, 小众漫画, 冷门漫画'
      }],

      link: [
         { rel: 'icon', href: '/images/favicon.png', type: 'image/png' }
      ]
   },

   plugins: ['~/plugins/io']
}