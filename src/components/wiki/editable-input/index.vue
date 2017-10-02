<template lang="jade">
  .editable-input.row
    .label {{ label }}
    c-input(v-model="editValue", :disabled="!editing", ref="input")
    c-button(:class="{'-gray': !editing}" @click="onClick") {{ editing ? 'DONE' : 'EDIT' }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')

    model:
      prop: 'value'
      event: 'change'

    props:
      'value':
        type: String
        default: ''
      'label':
        type: String
        default: ''
      'hint':
        type: String
        default: ''

    data: ->
      initValue: @value
      editValue: @value
      editing: false

    methods:
      onClick: ->
        if @editing
          @editing = false
        else
          @editing = true
          @$refs.input.focus()
</script>


<style lang="less">
  .editable-input{
    .label{
      width: 100px;
      text-align: right;
      font-weight: 500;
      font-size: 12px;
      color: #333;
      margin-right: 10px;
    }
    .button{
      margin-left: 10px;
    }
  }
</style>
