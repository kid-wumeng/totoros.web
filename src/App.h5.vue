<template lang="jade">
  #app(:style="appStyle")
    row.header.-between.-center
      .left
        cdn-image.logo(path="assets/logo?2017-11-09")
      row.right.-right.-center
        .item 讨论版
        .item MARKS
    .body
      keep-alive
        router-view(v-if="$route.meta.keepAlive", :key="key")
      router-view(v-if="!$route.meta.keepAlive")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

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
            backgroundColor: 'rgba(250, 250, 250, 1)'
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

  .header{
    box-sizing: border-box;
    padding: 0 32px;
    width: 100%;
    height: 48px;
    border-bottom: 1px solid rgb(245, 245, 245);
    >.left{
      >.logo{
        @width: 72px;
        width: @width;
        height: @width / 5;
        opacity: 0.9;
      }
    }
    >.right{
      >.item{
        text-align: center;
        font-size: 14px;
        font-weight: 600;
        margin-left: 32px;
      }
    }
  }
</style>
