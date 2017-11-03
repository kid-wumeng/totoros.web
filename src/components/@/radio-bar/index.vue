<template lang="jade">
  .radio-bar.row.-auto
    slot
</template>


<script lang="coffee">
  module.exports =
    model:
      prop: 'value'
      event: 'change'

    props:
      'value':
        type: null
        default: null

    mounted: ->
      @setRadioActives()
      for radio, i in @$children
        @setRadioBorder(radio, i)
        radio.$on('change', @change)

    updated: ->
      @setRadioActives()
      for radio, i in @$children
        @setRadioBorder(radio, i)
        radio.$on('change', @change)

    methods:
      setRadioActives: (radio) ->
        for radio in @$children
          if radio.value is @value
            radio.active = true
          else
            radio.active = false

      setRadioBorder: (radio, i) ->
        radio.borderTop    = true
        radio.borderBottom = true
        radio.borderRight  = true
        if i is 0
          radio.borderLeft = true

      change: (value) ->
        if value isnt @value
          @$emit('change', value)
</script>


<style lang="less" scoped>
  .radio-bar{
    background-color: #FFF;
    >.radio:first-child{
      border-radius: 3px 0 0 3px;
    }
    >.radio:last-child{
      border-radius: 0 3px 3px 0;
    }
  }
</style>
