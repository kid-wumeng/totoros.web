<template lang="jade">
  input.input(
    v-focus="autofocus",
    :value="value",
    :type="type",
    :placeholder="placeholder",
    :disabled="disabled",
    spellcheck="false",
    ref="input",
    @input="input"
    @keyup.enter="$emit('submit')"
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
    width: 100%;
    height: 34px;
    border-bottom: 0.5px solid #A2AEBA;
    border-radius: 0;
    &::placeholder{
      font-weight: 400;
      font-size: 14px;
      color: #A2AEBA;
    }
  }
</style>
