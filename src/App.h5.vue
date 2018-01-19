<template lang="jade">
  #app(:style="appStyle")
    c-header
    .body
      keep-alive
        router-view(v-if="$route.meta.keepAlive", :key="key")
      router-view(v-if="!$route.meta.keepAlive")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header': require('components.h5/header')

    metaInfo: ->
      titleTemplate: (title) ->
        if title then "#{title} - totoros" else 'totoros'

    computed:
      key: ->
        prefix = @$route?.meta?.key?.prefix ? ''
        params = @$route?.meta?.key?.params ? []
        query  = @$route?.meta?.key?.query  ? []
        hash   = @$route?.hash

        params = params.map (name) => @$route.params?[name] ? ''
        query  = query.map  (name) => @$route.query?[name]  ? ''

        key = prefix + params.join('') + query.join('') + hash
        return if key then key else null

      appStyle: ->
        if(@$route?.meta?.bgColor)
          return{
            backgroundColor: 'rgba(242, 243, 245, 0.8)'
          }
</script>


<style lang="less">

  @import '~assets/widgets';

  @font-face{
    font-family: "Lato";
    src: url(http://oy0aiwj7c.bkt.clouddn.com/assets/Lato-Regular.ttf?2017.11.03);
  }
  @font-face{
    font-family: "Lato";
    src: url(http://oy0aiwj7c.bkt.clouddn.com/assets/Lato-Semibold.ttf?2017.11.03);
    font-weight: 500;
  }
  @font-face{
    font-family: "Lato";
    src: url(http://oy0aiwj7c.bkt.clouddn.com/assets/Lato-Bold.ttf?2017.11.03);
    font-weight: 600;
  }

  *{
    margin: 0;
    border: 0;
    padding: 0;
    font-family: "Lato", "Helvetica Neue", "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
    font-size: 14px;
    color: #445669;
    -webkit-tap-highlight-color: transparent;
  }

  a{
    display: block;
    text-decoration: none;
  }

  .icon{
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  html{
    height: 100%;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }
</style>
