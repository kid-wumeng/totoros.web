<template lang="jade">
  router-link.subject-name(:to="getSubjectPath(subject)") {{ subject.name }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'subject':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .subject-name{
    display: inline;
    font-weight: 600;
    font-size: 14px;
    word-break: break-all;
    cursor: pointer;
    &:hover{
      text-decoration: underline;
    }
  }
</style>