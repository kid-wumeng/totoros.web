<template lang="jade">
  .edit-input-tags.row.-top
    input-tags(:tags="tags", :name="name" @del="del")
    c-button.-gray(@click="add") 添加
</template>


<script lang="coffee">
  module.exports =
    components:
      'input-tags': require('components/@/input-tags')
      'c-button':   require('components/@/button')

    model:
      prop:  'tags'
      event: 'change'

    props:
      'tags':
        type: Array
        default: -> []
      'name':
        type: String
        default: ''

    methods:
      add: ->
        @$emit('add')

      del: (index) ->
        tags = [@tags...]
        tags.splice(index, 1)
        @$emit('change', tags)
</script>


<style lang="less">
  .edit-input-tags{
    .input-tags{
      width: auto;
      flex: auto;
    }
    .button{
      flex: none;
      margin-left: 10px;
    }
  }
</style>
