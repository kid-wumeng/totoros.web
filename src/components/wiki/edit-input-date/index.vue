<template lang="jade">
  .edit-input-date.row.-top
    input-date(v-model="current", :disabled="!editing", ref="input-date")
    c-button(:class="{'-gray': !editing}" @click="edit") {{ editing ? '完成' : '编辑' }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'input-date': require('components/@/input-date')
      'c-button':   require('components/@/button')

    model:
      prop:  'dateGroup'
      event: 'change'

    props:
      'dateGroup':
        type: Object
        default: null

    data: ->
      current: @dateGroup
      last:    @dateGroup
      editing: !@exist(@dateGroup)

    methods:
      exist: (dateGroup) ->
        return dateGroup?.year or dateGroup?.month or dateGroup?.day

      isNew: ->
        return @current?.year  isnt @last?.year  or
               @current?.month isnt @last?.month or
               @current?.day   isnt @last?.day

      edit: ->
        if @editing
          if @isNew()
            @last = @current
            @$emit('change', @current)
          @editing = false
        else
          @$refs['input-date'].focus()
          @editing = true
</script>


<style lang="less">
  .edit-input-date{
    .input-date{
      width: auto;
      flex: auto;
    }
    .button{
      flex: none;
      margin-left: 10px;
    }
  }
</style>
