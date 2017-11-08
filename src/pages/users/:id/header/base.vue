<template lang="jade">
  .base
    row.-center
      .name {{ user.name }}
      .idolCount(v-if="user.idolCount" @click="replaceUserPage(user, 'idols')") 关注{{ user.idolCount }}人
      .fanCount(v-if="user.fanCount"   @click="replaceUserPage(user, 'fans')") 被{{ user.fanCount }}人追随
    row.-center
      .motto {{ user.motto }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .base{
    box-sizing: border-box;
    .name{
      font-weight: 600;
      font-size: 16px;
    }
    .motto{
      margin-top: 5px;
      font-size: 13px;
      color: #707C88;
    }
    .idolCount,
    .fanCount{
      margin-left: 10px;
      font-size: 12px;
      color: #A2AEBA;
      cursor: pointer;
    }
  }
</style>