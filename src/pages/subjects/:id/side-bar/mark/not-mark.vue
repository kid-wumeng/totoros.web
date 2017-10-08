<template lang="jade">
  detail-box.not-mark(title="标记")
    c-button.-gray(@click="showModal('will-do')") {{ model.mark.displayStatus('will-do', subject.type) }}
    c-button.-gray(@click="showModal('doing')")   {{ model.mark.displayStatus('doing',   subject.type) }}
    c-button.-gray(@click="showModal('done')")    {{ model.mark.displayStatus('done',    subject.type) }}
    c-button.-gray(@click="showModal('do-not')")  {{ model.mark.displayStatus('do-not',  subject.type) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':   require('components/@/button')
      'detail-box': require('components/wiki/detail-box')

    props:
      'subject':
        type: Object
        required: true

    data: ->
      hasSure: false

    computed:
      path: -> @$route.meta.path

    methods:
      showModal: (initStatus) ->
        @dispatch('show-mark-modal', {subject: @subject, initStatus})
</script>


<style lang="less" scoped>
  .not-mark{
    .button{
      width: 100%;
      font-weight: 400;
      font-size: 13px;
      margin-bottom: 6px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>