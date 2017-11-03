<template lang="jade">
  .done-animes
    detail-area(:title="title", :tabs="tabs")
      gallery(:cols="8", :padding="5")
        subject-face(v-for="mark in marks", :key="mark.id", :subject="mark.subject" frame fixed-height)
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area':  require('components/user/detail-area')
      'gallery':      require('components/@/gallery')
      'subject-face': require('components/image/subject-face')

    props:
      'user':
        type: Object
        required: true

    computed:
      title: -> "#{@user.name}标记的动画"

      tabs: ->
        tabs = @model.mark.STATUSES.map (status) =>
          displayStatus = @model.mark.displayStatus(status, 'anime')
          count  = @model.user.markStat(@user, status, 'anime')
          return{
            label: "#{displayStatus} #{count} 部"
            count: count
            click: => @toUserPage(@user, "animes?status=#{status}")
          }
        return tabs.filter (tab) -> tab.count

      marks: ->
        marks = @user.marks ? []
        marks = marks.filter (mark) =>
          mark.status is 'done' and @model.subject.isType(mark.subject.type, 'anime')
        return marks
</script>


<style lang="less" scoped>
  .done-animes{
    .item{
    }
  }
</style>