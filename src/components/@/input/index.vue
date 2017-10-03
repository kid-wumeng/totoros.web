<template lang="jade">
  input.input.input-box(
    v-focus="autofocus",
    :value="value",
    :type="type",
    :placeholder="placeholder",
    :disabled="disabled",
    spellcheck="false",
    ref="input",
    @input="input"
  )
</template>


<script lang="coffee">
  module.exports =
    props:
      'autofocus':
        type: Boolean
        default: false
      'value':
        type: null
        default: ''
      'type':
        type: String
        default: 'text'
      'placeholder':
        type: String
        default: ''
      'disabled':
        type: Boolean
        default: false

    methods:
      input: (e) ->
        @$emit('input', e.target.value)

      focus: ->
        setTimeout =>
          @$refs.input.focus()
</script>


<style lang="less" scoped>
  .input{
    height: 34px;
  }
</style>
