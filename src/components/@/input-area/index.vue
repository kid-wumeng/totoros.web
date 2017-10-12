<template lang="jade">
  textarea.input-area.input-box(
    v-focus="autofocus",
    :value="value",
    :type="type",
    :placeholder="placeholder",
    :rows="rows",
    :disabled="disabled",
    spellcheck="false",
    ref="textarea",
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
        type: String
        default: ''
      'type':
        type: String
        default: 'text'
      'placeholder':
        type: String
        default: ''
      'rows':
        type: Number
        default: 3
      'disabled':
        type: Boolean
        default: false

    methods:
      input: (e) ->
        @$emit('input', e.target.value)

      focus: ->
        setTimeout =>
          @$refs['textarea'].focus()

      getCursorPosition: ->
        return @$refs['textarea'].selectionStart
</script>


<style lang="less" scoped>
  .input-area{
    padding-top: 7px;
    padding-bottom: 7px;
    resize: none;
  }
</style>
