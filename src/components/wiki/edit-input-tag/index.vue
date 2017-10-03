<template lang="jade">
  .edit-input-tag.row.-top
    input-tag(:tags="edit_tags" @del="del")
    c-button.-gray(@click="add") 添加
</template>


<script lang="coffee">
  module.exports =
    components:
      'input-tag': require('components/@/input-tag')
      'c-button':  require('components/@/button')

    model:
      prop:  'tags'
      event: 'change'

    props:
      'tags':
        type: Array
        default: -> []
      'promptMessage':
        type: String
        default: ''

    data: ->
      edit_tags: @tags

    methods:
      add: ->
        @prompt(@promptMessage, '').then (tag) =>
          if tag
            if !@edit_tags.includes(tag)
              @edit_tags.push(tag)
              @$emit('change', @edit_tags)

      del: (delTag) ->
        @edit_tags = @edit_tags.filter (tag) -> tag isnt delTag
        @$emit('change', @edit_tags)
</script>


<style lang="less">
  .edit-input-tag{
    .input-tag{
      width: auto;
      flex: auto;
    }
    .button{
      flex: none;
      margin-left: 10px;
    }
  }
</style>
