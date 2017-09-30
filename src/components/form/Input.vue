<template lang="jade">
  input.input.input-box(
    v-focus="focus",
    :value="value",
    :type="type",
    :placeholder="placeholder",
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
      'disabled':
        type: Boolean
        default: false
    methods:
      input: (e) -> @$emit('input', e.target.value)
</script>


<style lang="less" scoped>
  .input{
  }
</style>
