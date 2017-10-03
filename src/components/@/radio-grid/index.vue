<template lang="jade">
  .radio-grid.row.-left.-wrap
    slot
</template>


<script lang="coffee">
  module.exports =
    model:
      prop:  'values'
      event: 'change'

    props:
      'values':
        type: Array
        default: -> []
      'cols':
        type: Number
        default: 4


    mounted: ->
      @setRadioActive()
      for radio, i in @$children
        @setRadioWidth(radio)
        @setRadioBorder(radio, i)
        radio.$on('change', @change)

    watch:
      'values': ->
        @setRadioActive()

    methods:
      setRadioActive: ->
        for radio in @$children
          @setRadioActiveEach(radio)

      setRadioActiveEach: (radio) ->
        if @values.includes(radio.value)
          radio.active = true
        else
          radio.active = false

      setRadioWidth: (radio) ->
        radio.$el.style.width = "#{100/@cols}%"

      setRadioBorder: (radio, i) ->
        radio.borderRight = true
        radio.borderBottom = true
        if i < @cols
          radio.borderTop = true
        if i % @cols is 0
          radio.borderLeft = true

      change: (value, active) ->
        values = [@values...]

        if active
          values.push(value)
        else
          values = values.filter (one) -> one isnt value

        @$emit('change', values)
</script>


<style lang="less" scoped>
  .radio-grid{
    background-color: #FFF;
    border-radius: 3px;
  }
</style>
