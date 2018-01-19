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
    font-weight: 500;
    font-size: 14px;
    color: #445669;
    word-break: break-all;
    cursor: pointer;
    &:hover{
      text-decoration: underline;
    }
  }
</style>