<template lang="jade">
  #forums(v-if="forum")
    c-head(:forum="forum")
    router-view(:forum="forum")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-head': require('./head')

    data: ->
      forum: null

    computed:
      forumID: -> parseInt(if @routeID then @routeID else 2)

    activated: ->
      @init()

    methods:
      init: ->
        @forum = await api.call('forum.get', @forumID, {open: true})
</script>


<style lang="less" scoped>
  #forums{
    padding-bottom: 100px;
  }
</style>