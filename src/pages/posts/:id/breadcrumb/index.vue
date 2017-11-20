<template lang="jade">
  .breadcrumb(v-if="login")
    span.forum(@click="toforumPage(forum)") {{ forum.name }}
    span.sep /
    span.title {{ post.title }}
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
      font-size: 14px;
      cursor: pointer;
      color: #BBB;
      &:hover{
        text-decoration: underline;
      }
    }
    .sep{
      font-size: 14px;
      color: #DDD;
      margin: 0 6px;
    }
    .title{
      font-weight: 600;
      font-size: 16px;
      color: #333;
    }
  }
</style>
