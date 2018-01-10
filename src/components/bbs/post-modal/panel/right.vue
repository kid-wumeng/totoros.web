<template lang="jade">
  .right
    relative-wiki-manager(
      desc="帖子会在关联词条下显示",
      :relative-subjects="relativeSubjects"
      @add-subject="addSubject"
      @del-subject="delSubject"
    )
</template>


<script lang="coffee">
  module.exports =
    components:
      'relative-wiki-manager': require('components/@/relative-wiki-manager')

    computed:
      relativeSubjects: -> @state['post-modal'].relativeSubjects ? []

    methods:
      addSubject: (subject) ->
        @commit('post-modal/ADD_RELATIVE_SUBJECT', subject)

      delSubject: (subject) ->
        @commit('post-modal/DEL_RELATIVE_SUBJECT', subject)
</script>


<style lang="less" scoped>
  .right{
  }
</style>