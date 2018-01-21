<template lang="jade">
  row.mark-item(:class="{'-showUser': showUser}")
    .left
      face(:mark="mark", :showUser="showUser", :showSubject="showSubject")
    .right
      row.-between.-center
        row.-center
          name(:mark="mark", :showUser="showUser", :showSubject="showSubject")
          .desc(v-if="showSubject") {{ desc }}
        row.-center
          .date {{ model.date.display(mark.createDate) }}
          .update(v-if="showActions && isMe(mark.user)" @click="update") 修改标记
          action-sheet(v-if="showActions && isMe(mark.user)", :actions="actions")
      row.-between
        column
          text-area.comment(v-if="comment", :text="comment")
          mark-score-simple(:mark="mark")
        resources(v-if="showResources", :subject="mark.subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'mark-score-simple': require('components/user/mark-score-simple')
      'text-area':         require('components/@/text-area')
      'action-sheet':      require('components/@/action-sheet')
      'c-button':          require('components/@/button')
      'face':              require('./face')
      'name':              require('./name')
      'resources':         require('./resources')

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
      'showActions':
        type: Boolean
        default: false
      'showResources':
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
        desc = ''
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
      margin-left: 20px;
      margin-top: -1px;
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
    .comment{
      flex: none;
      margin-top: 15px;
      margin-left: 13px;
      line-height: 19px;
      font-size: 13px;
      color: #707C88;
    }
    .mark-score-simple{
      margin-top: 15px !important;
    }
    .column{
      flex: auto;
    }
  }
  .mark-item.-showUser{
    >.right{
      margin-left: 12px;
    }
    .comment{
      margin-top: 9px;
    }
    .mark-score-simple{
      margin-top: 10px;
    }
  }
</style>