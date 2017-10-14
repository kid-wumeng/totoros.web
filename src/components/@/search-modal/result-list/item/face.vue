<template lang="jade">
  .face
    user-face(v-if="type === 'user'", :user="result")
    subject-face(v-else-if="type === 'subject'", :subject="result")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face':    require('components/image/user-face')
      'subject-face': require('components/image/subject-face')

    props:
      'result':
        type: Object
        required: true

    computed:
      type: -> @state['search-modal'].type
</script>


<style lang="less" scoped>
  .face{
  }
</style>