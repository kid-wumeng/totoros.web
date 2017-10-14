<template lang="jade">
  .breadcrumb.row.-left(v-if="login")
    .forum(@click="toForumPage(forum)") {{ forum.name }}
    .sep /
    .title {{ post.title }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'post':
        type: Object
        required: true

    computed:
      forum: -> @post.forum
</script>


<style lang="less" scoped>
  .breadcrumb{
    .forum{
      font-weight: 600;
      font-size: 13px;
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
