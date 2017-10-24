<template lang="jade">
  .left
    .row.-right
      c-button(@click="add") 添加资源Link
    edit-input(
      v-for="(resource, index) in resources",
      :key="index",
      :value="resource.url"
      button="delete"
      @delete="del(resource)"
    )
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':   require('components/@/button')
      'edit-input': require('components/wiki/edit-input')

    computed:
      subject:   -> @state['edit-subject-resources-modal'].subject
      resources: -> @subject.resources ? []

    methods:
      add: ->
        url = await @prompt('资源页面地址', '')
        if @model.assets.isUrl(url)
          resource = {url}
          result = await @api.call('subject.addResource', @subject.id, resource)
          @done(result)
        else
          @notify('fail', '请使用标准URL')

      del: (resource) ->
        result = await @api.call('subject.deleteResource', @subject.id, resource.url)
        @done(result)

      done: (result) ->
        @commit('UPDATE_SUBJECT', result.subject)
        @commit('edit-subject-resources-modal/ADD_RECORD', result.record)
</script>


<style lang="less" scoped>
  .left{
    box-sizing: border-box;
    width: 600px;
    height: 100%;
    padding: 0 80px 0 30px;
    overflow: scroll;
    >*{
      margin-bottom: 16px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>