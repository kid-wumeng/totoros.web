<template lang="jade">
  .edit-input.row
    c-input(v-model="edit_value", :type="type", :disabled="!editing" ref="input")
    c-button(:class="{'-gray': !editing}" @click="edit") {{ editing ? '完成' : '编辑' }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')

    model:
      prop:  'value'
      event: 'change'

    props:
      'value':
        type: null
        default: ''
      'type':
        type: String
        default: 'text'

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
          @$refs.input.focus()
          @editing = true
</script>


<style lang="less">
  .edit-input{
    .input{
      width: auto;
      flex: auto;
    }
    .button{
      flex: none;
      margin-left: 10px;
    }
  }
</style>
