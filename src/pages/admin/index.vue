<template lang="jade">
  #admin(v-if="admin")
    .wrap
      h1 ADMIN
      tab-bar
      .main
        router-view
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar': require('./tab-bar')

    metaInfo: ->
      switch @$route.meta.path
        when 'users'  then title = '用户'
        when 'forums' then title = '讨论版'
        when 'sync'   then title = '同步'
      return {title}
</script>


<style lang="less" scoped>
  #admin{
    background-color: #FFF;
    overflow: hidden;
    .wrap{
      margin: 32px auto;
      width: 600px;
      >h1{
        font-size: 20px;
      }
      >.main{
        border: 1px solid #FFF;
        border-radius: 3px;
        box-shadow: 0 0 6px -3px #000;
      }
    }
  }
</style>
