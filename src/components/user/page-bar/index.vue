<template lang="jade">
  .user-page-bar
    page-bar(:page="page", :size="size", :total="total" @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'page-bar':  require('components/@/page-bar')

    props:
      'user':
        type: Object
        required: true

    computed:
      main:   -> @$route.meta.path.replace(/s$/, '')
      status: -> @$route.query.status
      type:   ->
        if @$route.query.type
          return @main + '-' + @$route.query.type
        else
          return @main

      page:  -> @routePage
      size:  -> 20
      total: -> @model.user.markStat(@user, @status, @type)

    methods:
      change: (page) ->
        @$router.replace({
          query: @$route.query
          hash: "##{page}"
        })
</script>


<style lang="less" scoped>
  .user-page-bar{
    margin-top: 32px;
  }
</style>
