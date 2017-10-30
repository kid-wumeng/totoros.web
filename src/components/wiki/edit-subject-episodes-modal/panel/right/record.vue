<template lang="jade">
  .record.row.-top.-left
    .left
      .date {{ model.date.display(record.editDate) }}
    .right
      user-name(:user="record.user")
      div.episode(v-if="showNewEpisode") {{ displayNewEpisode }}
      del.episode(v-if="showOldEpisode") {{ displayOldEpisode }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-name': require('components/user/user-name')

    props:
      'record':
        type: Object
        required: true

    computed:
      type:       -> @record.type
      oldEpisode: -> @record.oldEpisode
      newEpisode: -> @record.newEpisode

      showOldEpisode: -> ['update', 'delete'].includes(@type)
      showNewEpisode: -> ['create', 'update'].includes(@type)

      displayOldEpisode: -> @displayEpisode(@oldEpisode)
      displayNewEpisode: -> @displayEpisode(@newEpisode)

    methods:
      displayEpisode: (episode) ->
        order      = '#' + episode.order
        name       = episode.name
        nameOrigin = episode.nameOrigin
        intro      = episode.intro
        return [order, name, nameOrigin, intro].filter((value) -> value).join(' ')
</script>


<style lang="less" scoped>
  .record{
    padding: 16px 20px;
    &:nth-child(odd){
      background-color: rgba(250, 250, 250, 1);
    }
    .left{
      width: 80px;
      text-align: right;
      .date{
        font-size: 13px;
        color: #A2AEBA;
      }
    }
    .right{
      flex: auto;
      margin-left: 12px;
      .user-name{
        display: inline-block;
        font-size: 13px;
      }
      .episode{
        flex: auto;
        width: 380px;
        word-wrap: break-word;
        box-sizing: border-box;
        display: block;
        margin-top: 6px;
        font-size: 13px;
      }
      del.episode{
        color: #BBB;
      }
    }
  }
</style>
