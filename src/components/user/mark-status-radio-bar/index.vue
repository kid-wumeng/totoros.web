<template lang="jade">
  .mark-status-radio-bar
    radio-bar(:value="status" @change="change")
      radio(v-for="radio in radios", :key="radio.value", :label="radio.label", :value="radio.value", :link="radio.link")
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
      main:   -> (@$route.meta.path ? '').replace(/s$/, '')
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
            link:  "#{@$route.path}?status=#{status}"
          })

        return radios.filter (radio) -> radio.count

    methods:
      change: (status) ->
        @$router.push({
          query:
            type: undefined
            status: if status then status else undefined
        })
</script>


<style lang="less" scoped>
  .mark-status-radio-bar{
    margin-right: 7px;
    .radio-bar{
      background-color: transparent;
    }
    .radio{
      padding: 0 16px;
      height: 26px;
      font-weight: 500;
      font-size: 13px;
      color: #7ec2f3;
      border-color: #7ec2f3 !important;
      box-shadow: none !important;
    }
    .radio:first-child{
      border-radius: 2px 0 0 2px !important;
    }
    .radio:last-child{
      border-radius: 0 2px 2px 0 !important;
    }
    .radio.-active{
      font-weight: 600;
      color: #FFF;
      background-color: #7ec2f3;
    }
  }
</style>
