<template lang="jade">
  #subjects-detail(v-if="subject")
    detail-frame
      .name(slot="name") {{ subject.name }}
      .desc(slot="desc") {{ desc }}
      detail-tab-bar(
        slot="tab-bar",
        :tabs="tabs",
        :active="$route.meta.path",
        @change="change"
      )
      router-view(slot="main", :subject="subject")
      side-bar(slot="side", :subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-frame':   require('components/wiki/detail-frame')
      'detail-tab-bar': require('components/wiki/detail-tab-bar')
      'side-bar':       require('./side-bar')

    computed:
      id:         -> @routeID
      subject:    -> @state['subject-detail'].subject
      name:       -> @subject.name
      nameOrigin: -> @subject.nameOrigin
      type:       -> @model.subject.displayType(@subject.type)
      season:     -> @subject.season
      desc: ->
        desc = @type
        if(@season)
          desc += " / Season #{@season}"
        return desc

      tabs: -> [{
        label: if @nameOrigin then @nameOrigin else @name
        value: ''
      },{
        label: '世界观'
        value: 'world'
      },{
        label: 'EPISODE'
        value: 'episodes'
        count: @subject.episodeCount
      },{
        label: 'CAST'
        value: 'casts'
        count: @subject.castCount
      },{
        label: 'STAFF'
        value: 'staffs'
        count: @subject.staffCount
      }]

    watch:
      'id': -> @init()

    methods:
      init: ->
        @dispatch('subject-detail/init', @id)

      change: (tab) ->
        @replaceSubjectPage(@subject, tab.value)
</script>


<style lang="less" scoped>
  #subjects-detail{
    display: flex;
    background-color: #FFF;
  }
</style>
