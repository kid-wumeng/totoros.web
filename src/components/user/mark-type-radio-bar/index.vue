<template lang="jade">
  .mark-type-radio-bar
    radio-bar(:value="type" @change="change")
      radio(v-for="(radio, index) in radios", :key="index", :label="radio.label", :value="radio.value", :link="radio.link")
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
      status: -> @$route.query.status ? ''
      type:   ->
        if @$route.query.type
          return @$route.query.type
        else
          if @status
            return undefined
          else
            return ''

      radios: ->
        count  = @model.user.markStat(@user, null, @main)
        radios = [{
          label: "所有标记"
          value: ''
          count: count
          link:  "#{@$route.path}"
        }]

        types = @model.subject.unfoldType(@main)

        for type in types
          sub   = @model.subject.displayTypes(type)[1]
          count = @model.user.markStat(@user, null, type)
          radios.push({
            label: "#{sub} #{count}"
            value: type.split('-')[1]
            count: count
            link:  "#{@$route.path}?type=#{type}"
          })

        return radios.filter (radio) -> radio.count

    methods:
      change: (type) ->
        @$router.push({
          query:
            type: if type then type else undefined
            status: undefined
        })
</script>


<style lang="less" scoped>
  .mark-type-radio-bar{
    margin-left: 7px;
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
