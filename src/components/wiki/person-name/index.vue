<template lang="jade">
  .person-name(@click="toPersonPage(person)") {{ person.name }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'person':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .person-name{
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