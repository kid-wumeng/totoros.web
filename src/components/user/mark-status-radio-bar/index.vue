<template lang="jade">
  .mark-status-radio-bar
    radio-bar(:value="status" @change="change")
      radio(v-for="radio in radios", :key="radio.value", :label="radio.label", :value="radio.value")
</template>


<script lang="coffee">
  module.exports =
    components:
      'radio-bar': require('components/@/radio-bar')
      'radio':     require('components/@/radio')

    props:
      'user':
        type: Object
        required: true

    computed:
      main:   -> @$route.meta.path.replace(/s$/, '')
      type:   -> @$route.query.type   ? ''
      status: -> @$route.query.status ? ''

      radios: ->
        radios   = []
        statuses = @model.mark.STATUSES

        for status in statuses
          displayStatus = @model.mark.displayStatus(status, @main)
          count         = @model.user.markStat(@user, status, @main)
          radios.push({
            label: "#{displayStatus} #{count}"
            value: status
            count: count
          })

        return radios.filter (radio) -> radio.count

    methods:
      change: (status) ->
        @$router.replace({
          query:
            type: undefined
            status: if status then status else undefined
        })
</script>


<style lang="less" scoped>
  .mark-status-radio-bar{
    .radio{
      padding: 0 20px;
      height: 30px;
    }
  }
</style>
