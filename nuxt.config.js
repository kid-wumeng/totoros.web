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
   }
}