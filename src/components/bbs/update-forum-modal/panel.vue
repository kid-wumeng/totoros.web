<template lang="jade">
  .panel
    form-item(label="* 论坛名")
      edit-input(:value="name" @change="changeName")

    form-item(label="* 论坛名简写")
      edit-input(:value="nameSimple" @change="changeNameSimple")

    form-item(label="* 是否开放")
      radio-bar(:value="open" @change="changeOpen")
        radio(label="开放",   :value="true")
        radio(label="不开放", :value="false")

    //- form-item(label="简介")
    //-   edit-input-area(:value="intro" @change="changeIntro")

    form-item(label="排序")
      edit-input(:value="order" type="number", @change="changeOrder")
</template>


<script lang="coffee">
  module.exports =
    components:
      'form-item':       require('components/@/form-item')
      'radio-bar':       require('components/@/radio-bar')
      'radio':           require('components/@/radio')
      'edit-input':      require('components/wiki/edit-input')
      'edit-input-area': require('components/wiki/edit-input-area')

    computed:
      forum:      -> @state['update-forum-modal'].forum
      name:       -> @forum.name
      nameSimple: -> @forum.nameSimple
      open:       -> @forum.open  ? false
      # intro:      -> @forum.intro ? ''
      order:      -> @forum.order

    methods:
      changeName: (name) ->
        @submit({name})

      changeNameSimple: (nameSimple) ->
        @submit({nameSimple})

      changeOpen: (open) ->
        @submit({open})

      # changeIntro: (intro) ->
      #   @submit({intro})

      changeOrder: (order) ->
        @submit({order: parseInt(order)})

      submit: (data) ->
        forum = await @api.call('forum.update', @forum.id, data)
        @commit('UPDATE_forum', forum)
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