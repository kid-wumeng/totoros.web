<template lang="jade">
  #subjects-id-staffs
    list(:staffs="staffs")
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
      staffs: -> @state['subject-detail'].staffs

    methods:
      init: ->
        @dispatch('subject-detail/get-staffs', @subject.id)
</script>


<style lang="less" scoped>
  #subjects-id-staffs{
    padding-top: 16px;
  }
</style>
