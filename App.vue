<template lang="jade">
   #App
      Header(ref="header", :remind-count="3")
      nuxt(v-show="show", :style="style")
</template>



<script lang="coffee">

   Vue = require('vue').default ? require('vue')
   Sai = require('sai.io/dist/index.web-lite')


   io =
      allSubjectTypes:        require('~/io/allSubjectTypes')
      cdn:                    require('~/io/cdn')
      dev:                    require('~/io/dev')
      dpr:                    require('~/io/dpr')
      formatDate:             require('~/io/formatDate')
      formatMarkStep:         require('~/io/formatMarkStep')
      formatScore:            require('~/io/formatScore')
      formatSubjectType:      require('~/io/formatSubjectType')
      formatSubjectTypeOrWay: require('~/io/formatSubjectTypeOrWay')
      formatSubjectWay:       require('~/io/formatSubjectWay')
      isID:                   require('~/io/isID')
      resize:                 require('~/io/resize')
      sleep:                  require('~/io/sleep')


   global.Sai = Vue.prototype.Sai = Sai
   global.io  = Vue.prototype.io  = io


   module.exports =

      components:
         'Header': require('~/components/Header').default

      data: ->
         height: 0

      computed:
         show: ->
            return @height > 0

         style: ->
            'height': @height + 'px'


      mounted: ->
         @setFavicon()
         @setHeight()
         window.addEventListener('resize', @setHeight)


      methods:
         setFavicon: ->

            link      = document.createElement('link')
            link.href = require('~/assets/images/favicon.png')
            link.rel  = 'icon'
            link.type = 'image/png'

            document.head.appendChild(link)


         setHeight: ->

            windowHeight = window.innerHeight
            headerHeight = @$refs.header.$el.offsetHeight

            @height = windowHeight - headerHeight
</script>



<style lang="less">

   @font-face {
      font-family: "Lato";
      font-weight: 400;
      src: url(~/assets/fonts/Lato-Regular.ttf);
   }

   @font-face {
      font-family: "Lato";
      font-weight: 500;
      src: url(~/assets/fonts/Lato-Medium.ttf);
   }

   @font-face {
      font-family: "Lato";
      font-weight: 600;
      src: url(~/assets/fonts/Lato-Semibold.ttf);
   }

   @font-face {
      font-family: "Ubuntu";
      font-weight: 400;
      src: url(~/assets/fonts/Ubuntu-R.ttf);
   }

   @font-face {
      font-family: "Ubuntu";
      font-weight: 500;
      src: url(~/assets/fonts/Ubuntu-M.ttf);
   }

   @font-face {
      font-family: "Ubuntu";
      font-weight: 600;
      src: url(~/assets/fonts/Ubuntu-B.ttf);
   }

   @font-face {
      font-family: "Adele";
      font-weight: 400;
      src: url(~/assets/fonts/ADELE-Light.ttf);
   }

   * {
      box-sizing: border-box;
      margin: 0;
      border: 0;
      padding: 0;
   }

   html {
      height: 100%;
   }

   body {
      min-height: 100%;
      font-family: "Lato", "Helvetica Neue", "Arial", "Verdana", "Roboto", "PingFang SC", "Hiragino Sans GB", sans-serif;;
      color: #242424;
      background-image: url(~/assets/images/bg.jpg);
      background-repeat: no-repeat;
      background-position: center;
      background-size: cover;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
   }

   li {
      list-style-position: inside;
   }

   a {
      color: inherit;
      text-decoration: none;
   }
</style>