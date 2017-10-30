<template lang="jade">
  #subjects-id-casts
    list(:casts="casts")
</template>


<script lang="coffee">
  module.exports =
    components:
      'list': require('./list')

    props:
      'subject':
        type: Object
        required: true

    computed:
      casts: -> @state['subject-detail'].casts

    methods:
      init: ->
        @dispatch('subject-detail/get-casts', @subject.id)
</script>


<style lang="less" scoped>
  #subjects-id-casts{
    padding-top: 16px;
  }
</style>
