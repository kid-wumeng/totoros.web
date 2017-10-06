<template lang="jade">
  #app
    c-header
    router-view.body

    totoro
    toast
    notify
    prompt
    create-subject-modal
    create-role-modal
    create-person-modal
    create-organization-modal
    edit-subject-base-modal
    edit-role-base-modal
    edit-person-base-modal
    edit-organization-base-modal
    upload-wiki-face-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header': require('components/@/header')
      'totoro':   require('components/@/totoro')
      'toast':    require('components/@/toast')
      'notify':   require('components/@/notify')
      'prompt':   require('components/@/prompt')
      'create-subject-modal':         require('components/wiki/create-subject-modal')
      'create-role-modal':            require('components/wiki/create-role-modal')
      'create-person-modal':          require('components/wiki/create-person-modal')
      'create-organization-modal':    require('components/wiki/create-organization-modal')
      'edit-subject-base-modal':      require('components/wiki/edit-subject-base-modal')
      'edit-role-base-modal':         require('components/wiki/edit-role-base-modal')
      'edit-person-base-modal':       require('components/wiki/edit-person-base-modal')
      'edit-organization-base-modal': require('components/wiki/edit-organization-base-modal')
      'upload-wiki-face-modal':       require('components/wiki/upload-wiki-face-modal')
</script>


<style lang="less">
  @import '~assets/widgets';

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
    background-color: rgba(250, 250, 250, 0.93);
  }

  #app{
    min-height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    .body{
      flex: auto;
      width: 100%;
    }
  }
</style>
