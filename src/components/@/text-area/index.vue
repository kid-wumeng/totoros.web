<template lang="jade">
  .text-area(:style="textStyle")
    .paragraph(v-for="paragraph in paragraphs", :style="paragraphStyle", @click="hasShowMore=true") {{ paragraph }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'text':
        type: String
        default: ''
      'limit':
        type: Number
        default: 0
      'indent':
        type: Boolean
        default: false
      'more':
        type: Boolean
        default: false

    data: ->
      hasShowMore: false

    computed:
      len: ->
        return @text.length

      isShowMore: ->
        return @limit and @len > @limit

      formatText: ->
        text = @text.replace(/^\s+|\s+$/g, '')
        if @isShowMore and !@hasShowMore
          text = text.slice(0, @limit)
          text += '... (more)'
        return text

      paragraphs: ->
        return @formatText.split(/\n+/g)

      textStyle: ->
        'cursor': if @isShowMore and !@hasShowMore then 'pointer' else 'default'

      paragraphStyle: ->
        'textIndent': if @indent then "2em" else 0
</script>


<style lang="less">
  .text-area{
    .paragraph{
      line-height: 20px;
      font-size: 13px;
      text-align: justify;
      text-indent: 26px;
      margin-top: 6px;
      &:first-child{
        margin-top: 0;
      }
    }
  }
</style>
