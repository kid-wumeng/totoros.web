<template lang="jade">
  .input-content
    action-bar
    input-area(ref="input-area", :value="content", placeholder="内容", :rows="rows" @input="input")
</template>


<script lang="coffee">
  module.exports =
    components:
      'input-area': require('components/@/input-area')
      'action-bar': require('./action-bar')

    props:
      'rows':
        type: Number
        default: 20

    computed:
      content: -> @state['input-content'].content

    methods:
      input: (content) ->
        @commit('input-content/SET_CONTENT', content)

    mounted: ->
      @commit('input-content/SET_GET_CURSOR_POSITION', @$refs['input-area'].getCursorPosition)
</script>


<style lang="less" scoped>
  .input-content{
    .input-area{
      margin-top: 12px;
    }
  }
</style>