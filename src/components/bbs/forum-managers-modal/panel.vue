<template lang="jade">
  .panel
    row.actiob-bar.-between.-center
      h1 {{ name }} 的版主
      c-button(@click="searchUser") 添加

    .manager-list
      row.manager.-between.-center(v-for="manager in managers", :key="manager.id")
        row.left.-center
          user-face(:user="manager" circle)
          .id \#{{ manager.id }}
          .name {{ manager.name }}
        .right
          c-button.-gray(@click="del(manager)") 卸任
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':  require('components/@/button')
      'user-face': require('components/image/user-face')

    computed:
      forum:    -> @state['forum-managers-modal'].forum
      name:     -> @forum.name
      managers: -> @forum.managers ? []

    methods:
      searchUser: ->
        user = await @dispatch('search-modal/show', {allowType: 'user'})
        if !(@managers.some (manager) => @isSame(user, manager))
          await @api.call('forum.addManager', @forum.id, user.id)
          @commit('forum-managers-modal/ADD_MANAGER', user)

      del: (manager) ->
        if(confirm("确认让 #{manager.name} 卸任吗？"))
          await @api.call('forum.delManager', @forum.id, manager.id)
          @commit('forum-managers-modal/DEL_MANAGER', manager)
</script>


<style lang="less" scoped>
  .panel{
    box-sizing: border-box;
    width: 400px;
    position: relative;
    top: -10%;
    h1{
      font-size: 20px;
    }
    .manager-list{
      margin-top: 30px;
      .manager{
        box-sizing: border-box;
        padding: 10px;
        margin-bottom: 8px;
        &:last-child{
          margin-bottom: 0;
        }
        .user-face{
          width: 24px;
          margin-left: 4px;
        }
        .id{
          margin-left: 8px;
        }
        .name{
          margin-left: 8px;
        }
      }
      .manager:nth-child(odd){
        background-color: rgb(249, 249, 249);
      }
    }
  }
</style>