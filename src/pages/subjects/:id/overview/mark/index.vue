<template lang="jade">
  .mark(v-if="markSure")
    has-mark(v-if="mark", :mark="mark")
    not-mark(v-else :subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'has-mark': require('./has-mark')
      'not-mark': require('./not-mark')

    props:
      'subject':
        type: Object
        required: true

    data: ->
      mark: null
      markSure: false

    created: ->
      @init()
      @listen('CREATE_MARK', @createMark)
      @listen('UPDATE_MARK', @updateMark)

    activated: ->
      @init()

    methods:
      init: ->
        @mark = await api.call('mark.sure', @subject.id)
        @markSure = true

      createMark: (mark) -> if @isSame(mark.subject, @subject) then @mark = mark
      updateMark: (mark) -> if @isSame(mark.subject, @subject) then @mark = mark
</script>


<style lang="less" scoped>
  .mark{
    align-items: stretch;
    .button{
      text-align: left;
      font-weight: 400;
      font-size: 13px;
      margin-bottom: 6px;
    }
  }
</style>