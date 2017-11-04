<template lang="jade">
  .breadcrumb(v-if="login")
    span.title {{ post.title }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'post':
        type: Object
        required: true

    computed:
      club: -> @post.club
</script>


<style lang="less" scoped>
  .breadcrumb{
    .club{
      font-weight: 600;
      font-size: 14px;
      color: #A2AEBA;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
    .sep{
      font-size: 13px;
      color: #A2AEBA;
      margin: 0 6px;
    }
    .title{
      font-weight: 600;
      font-size: 16px;
      color: #273340;
    }
  }
</style>
