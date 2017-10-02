<template lang="jade">
  textarea.input-area.input-box(
    v-focus="focus",
    :value="value",
    :type="type",
    :placeholder="placeholder",
    :rows="rows",
    :disabled="disabled",
    spellcheck="false",
    @input="input"
  )
</template>


<script lang="coffee">
  module.exports =
    props:
      'focus':
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
      input: (e) -> @$emit('input', e.target.value)
</script>


<style lang="less" scoped>
  .input-area{
    padding-top: 8px;
    padding-bottom: 8px;
    resize: none;
  }
</style>
