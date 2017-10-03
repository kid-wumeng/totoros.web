<template lang="jade">
  .input-date.row
    c-input(:value="year"  type="number", :disabled="disabled" @input="inputYear" ref="year")
    .hint 年
    c-input(:value="month" type="number", :disabled="disabled" @input="inputMonth")
    .hint 月
    c-input(:value="day"   type="number", :disabled="disabled" @input="inputDay")
    .hint 日
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input': require('components/@/input')

    model:
      prop:  'dateGroup'
      event: 'change'

    props:
      'dateGroup':
        type: Object
        default: null
      'disabled':
        type: Boolean
        default: false

    data: ->
      year:  if @dateGroup?.year  then "#{@dateGroup.year}"  else ''
      month: if @dateGroup?.month then "#{@dateGroup.month}" else ''
      day:   if @dateGroup?.day   then "#{@dateGroup.day}"   else ''

    methods:
      inputYear: (year) ->
        @year = year
        @change()

      inputMonth: (month) ->
        @month = month
        @change()

      inputDay: (day) ->
        @day = day
        @change()

      change: ->
        if !@year and !@month and !@day
          @$emit('change', null)
        else
          @$emit('change', {
            year:  parseInt(@year)
            month: parseInt(@month)
            day:   parseInt(@day)
          })

      focus: ->
        setTimeout =>
          @$refs.year.focus()
</script>


<style lang="less" scoped>
  .input-date{
    height: 34px;
    >.input{
      flex: auto;
    }
    >.hint{
      font-weight: 600;
      margin: 0 6px;
      &:last-child{
        margin-right: 0;
      }
    }
  }
</style>
