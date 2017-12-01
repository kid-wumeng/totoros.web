<template lang="jade">
  row.mark-item
    .left
      face(:mark="mark", :showUser="showUser", :showSubject="showSubject")
    .right
      row.-between.-center
        row.-center
          name(:mark="mark", :showUser="showUser", :showSubject="showSubject")
          .desc(v-if="showSubject") {{ desc }}
        row.-center
          .date {{ model.date.display(mark.createDate) }}
          .update(v-if="isMe(mark.user)" @click="update") 修改标记
          action-sheet(v-if="isMe(mark.user)", :actions="actions")
      row
        mark-score(:mark="mark")
        text-area.comment(:text="comment")
        column.-right
          mark-progress(v-if="mark.status === 'doing'", :mark="mark")
          resources(:subject="mark.subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'mark-score':    require('components/user/mark-score')
      'mark-progress': require('components/user/mark-progress')
      'text-area':     require('components/@/text-area')
      'action-sheet':  require('components/@/action-sheet')
      'c-button':      require('components/@/button')
      'face':          require('./face')
      'name':          require('./name')
      'resources':     require('./resources')

    props:
      'mark':
        type: Object
        required: true
      'showUser':
        type: Boolean
        default: false
      'showSubject':
        type: Boolean
        default: false

    data: ->
      actions: [{
        label: '删除本条标记'
        click: => @remove()
      }]

    computed:
      subject: -> @mark.subject
      name:    -> @subject.name
      type:    -> @model.subject.displayType(@subject.type)
      season:  -> @subject.season
      desc:    ->
        desc = @type
        if(@season)
          desc += " / Season #{@season}"
        return desc
      comment: -> @mark.comment ? ''

    methods:
      update: ->
        @dispatch('mark-modal/show', {subject: @subject})

      remove: ->
        await @api.call('mark.remove', @mark.id)
        @commit('REMOVE_MARK', @mark)
</script>


<style lang="less" scoped>
  .mark-item{
    box-sizing: border-box;
    >.right{
      flex: auto;
      margin-left: 12px;
      margin-top: -1px;
      >:nth-child(2){
        margin-top: 8px;
      }
    }
    .desc{
      margin-left: 9px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .date{
      font-size: 12px;
      color: #A2AEBA;
    }
    .update{
      margin-left: 16px;
      margin-right: 16px;
      font-weight: 600;
      font-size: 12px;
      color: #707C88;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
    .mark-score{
      flex: none;
    }
    .comment{
      flex: none;
      width: 480px;
      margin-left: 12px;
      line-height: 19px;
      font-size: 13px;
    }
    .column{
      flex: auto;
    }
    .mark-progress{
      flex: none;
      box-sizing: border-box;
      padding-left: 80px;
    }
  }
</style>