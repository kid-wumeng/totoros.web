<template lang="jade">
  .panel
    form-item(label="论坛名")
      edit-input(:value="name" @change="changeName")

    form-item(label="是否开放")
      radio-bar(:value="open" @change="changeOpen")
        radio(label="开放",   :value="true")
        radio(label="不开放", :value="false")
</template>


<script lang="coffee">
  module.exports =
    components:
      'form-item':  require('components/@/form-item')
      'radio-bar':  require('components/@/radio-bar')
      'radio':      require('components/@/radio')
      'edit-input': require('components/wiki/edit-input')

    computed:
      forum: -> @state['update-forum-modal'].forum
      name:  -> @forum.name
      open:  -> @forum.open ? false

    methods:
      changeName: (name) ->
        @submit({name})

      changeOpen: (open) ->
        @submit({open})

      submit: (data) ->
        forum = await @api.call('forum.update', @forum.id, data)
        @commit('UPDATE_FORUM', forum)
        @notify('done', '修改成功 ~', 800)
</script>


<style lang="less" scoped>
  .panel{
    box-sizing: border-box;
    width: 400px;
    position: relative;
    top: -10%;
    >*{
      margin-bottom: 16px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>