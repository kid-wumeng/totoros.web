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
      id: -> parseInt(if @routeID then @routeID else 2)

    activated: ->
      @init()

    methods:
      init: ->
        @forum = await api.call('forum.get', @id, {open: true})
</script>


<style lang="less" scoped>
  #forums{
  }
</style>