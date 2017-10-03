<template lang="jade">
  .edit-input-area.row.-top
    input-area(v-model="edit_value", :disabled="!editing", :rows="8" ref="input-area")
    c-button(:class="{'-gray': !editing}" @click="edit") {{ editing ? '完成' : '编辑' }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'input-area': require('components/@/input-area')
      'c-button':   require('components/@/button')

    model:
      prop:  'value'
      event: 'change'

    props:
      'value':
        type: String
        default: ''

    data: ->
      edit_value: @value
      last_value: @value
      editing: if @value then false else true

    methods:
      edit: ->
        if @editing
          if(@edit_value isnt @last_value)
            @last_value = @edit_value
            @$emit('change', @edit_value)
          @editing = false
        else
          @$refs['input-area'].focus()
          @editing = true
</script>


<style lang="less">
  .edit-input-area{
    .input-area{
      width: auto;
      flex: auto;
    }
    .button{
      flex: none;
      margin-left: 10px;
    }
  }
</style>
