<template lang="jade">
  #subjects-detail-marks
    mark-item(v-for="mark in marks", :key="mark.id", :mark="mark", :show-user="true")
    page-bar(:page="routePage", :size="size", :total="total" @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'mark-item': require('components/user/mark-item')
      'page-bar':  require('components/@/page-bar')

    props:
      'subject':
        type: Object
        required: true

    data: ->
      marks: []
      total: 0
      size:  0

    created: ->
      @init()

    activated: ->
      @init()

    methods:
      init: ->
        result = await api.call('mark.getAll', {
          sid: @subject.id
          page: @routePage
        })
        @marks = result.marks
        @total = result.total
        @size  = result.size

      change: (page) ->
        @$router.push({
          query: @$route.query
          hash: "##{page}"
        })
</script>


<style lang="less" scoped>
  #subjects-detail-marks{
    .mark-item{
      padding: 16px 12px;
      border-bottom: 1px dashed rgb(240, 240, 240);
    }
    .page-bar{
      margin-top: 24px;
    }
  }
</style>
