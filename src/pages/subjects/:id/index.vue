<template lang="jade">
  #subjects-id(v-if="subject")
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

    data: ->
      tabs: [{
        label: 'Overview'
        value: ''
      },{
        label: '世界观'
        value: 'world'
      },{
        label: 'Casts'
        value: 'casts'
        count: 6
      },{
        label: 'Staffs'
        value: 'staffs'
        count: 27
      },{
        label: 'Episodes'
        value: 'episodes'
        count: 12
      }]

    computed:
      id:      -> parseInt(@$route.params.id)
      subject: -> @state['subject-list'].items[@id]
      type:    -> @model.subject.displayType(@subject.type)
      season:  -> @subject.season
      desc: ->
        desc = @type
        if(@season)
          desc += " / Season #{@season}"
        return desc

    created: ->
      @init()

    watch:
      'id': -> @init()

    methods:
      init: ->
        @dispatch('get-subject', @id)

      change: (tab) ->
        @toSubjectPage(@subject, tab.value)
</script>


<style lang="less" scoped>
  #subjects-id{
    display: flex;
  }
</style>
