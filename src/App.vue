<template lang="jade">
  #app
    c-header
    .body
      keep-alive
        router-view(v-if="$route.meta.keepAlive", :key="key")
      router-view(v-if="!$route.meta.keepAlive")

    //- totoro
    toast
    notify
    confirm
    prompt
    search-modal
    mark-modal
    post-modal
    create-subject-modal
    create-role-modal
    create-person-modal
    create-organization-modal
    edit-subject-base-modal
    edit-role-base-modal
    edit-person-base-modal
    edit-organization-base-modal
    wiki-face-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header': require('components/@/header')
      'totoro':   require('components/@/totoro')
      'toast':    require('components/@/toast')
      'notify':   require('components/@/notify')
      'prompt':   require('components/@/prompt')
      'confirm':  require('components/@/confirm')
      'search-modal':                 require('components/@/search-modal')
      'mark-modal':                   require('components/user/mark-modal')
      'post-modal':                   require('components/bbs/post-modal')
      'create-subject-modal':         require('components/wiki/create-subject-modal')
      'create-role-modal':            require('components/wiki/create-role-modal')
      'create-person-modal':          require('components/wiki/create-person-modal')
      'create-organization-modal':    require('components/wiki/create-organization-modal')
      'edit-subject-base-modal':      require('components/wiki/edit-subject-base-modal')
      'edit-role-base-modal':         require('components/wiki/edit-role-base-modal')
      'edit-person-base-modal':       require('components/wiki/edit-person-base-modal')
      'edit-organization-base-modal': require('components/wiki/edit-organization-base-modal')
      'wiki-face-modal':              require('components/wiki/wiki-face-modal')

    computed:
      key: ->
        prefix = @$route?.meta?.key?.prefix ? ''
        params = @$route?.meta?.key?.params ? []
        query  = @$route?.meta?.key?.query  ? []

        params = params.map (name) => @$route.params?[name] ? ''
        query  = query.map  (name) => @$route.query?[name]  ? ''

        key = prefix + params.join('') + query.join('')
        return if key then key else null

    watch:
      '$route': ->
        @commit('router/SET_JUST_BACK', false)

    created: ->
      window.addEventListener 'popstate', =>
        @commit('router/SET_JUST_BACK', true)
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

  body{
    height: 100%;
    background-color: rgba(250, 250, 250, 1);
  }

  #app{
    min-height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    .body{
      flex: auto;
      width: 100%;
      margin-bottom: 30px;
    }
  }
</style>
