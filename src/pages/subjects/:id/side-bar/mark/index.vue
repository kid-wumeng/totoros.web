<template lang="jade">
  .mark(v-if="hasSure")
    has-mark(v-if="mark", :mark="mark")
    not-mark(v-else, :subject="subject")
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
      hasSure: false

    computed:
      mark: ->
        for id, mark of @state['mark-list'].items
          if mark.id is @subject.id
            return mark
        return null

    created: ->
      api.call('mark.sure', @subject.id).done (mark) =>
        if(mark)
          @commit('UPDATE_MARK', mark)
        @hasSure = true
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