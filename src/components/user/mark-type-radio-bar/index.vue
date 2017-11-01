<template lang="jade">
  .mark-type-radio-bar
    radio-bar(:value="type" @change="change")
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
          label: "All #{@main}s #{count}"
          value: ''
          count: count
        }]

        types = @model.subject.unfoldType(@main)

        for type in types
          sub   = @model.subject.displayType(type)
          count = @model.user.markStat(@user, null, type)
          radios.push({
            label: "#{sub} #{count}"
            value: type.split('-')[1]
            count: count
          })

        return radios.filter (radio) -> radio.count

    methods:
      change: (type) ->
        @$router.replace({
          query:
            type: if type then type else undefined
            status: undefined
        })
</script>


<style lang="less" scoped>
  .mark-type-radio-bar{
    .radio{
      padding: 0 20px;
      height: 30px;
    }
  }
</style>
