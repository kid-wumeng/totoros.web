<template lang="jade">
  .forum-list
    c-table
      .forum(v-for="forum in forums", :key="forum.id")
        .order {{ forum.order ? 'Order ' + forum.order : '' }}
        .name  {{ forum.name }}
        .open(:class="{'-open': forum.open}") {{ forum.open ? '开放ing' : '未开放' }}
        .actions
          c-button(@click="update(forum)") 修改
          c-button(@click="uploadFace(forum)") 上传FACE
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-table':  require('components/@/table')
      'c-button': require('components/@/button')

    computed:
      forums: -> @state['admin-forums'].forums

    methods:
      update: (forum) ->
        @dispatch('update-forum-modal/show', forum.id)

      uploadFace: (forum) ->
        @dispatch('forum-face-modal/show', forum.id)
</script>


<style lang="less">
  .forum-list{
    .forum{
      .order{
        width: 15%;
      }
      .name{
        width: 40%;
      }
      .open{
        width: 15%;
        &.-open{
          color: #40C9A2;
        }
      }
      .actions{
        >*{
          margin-right: 6px;
          &:last-child{
            margin-right: 0;
          }
        }
      }
    }
  }
</style>