<template lang="jade">
  .text-area(:style="textStyle")
    .paragraph(v-for="paragraph in paragraphs", :style="paragraphStyle", @click="click") {{ paragraph }}
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
      'gap':
        type: Number
        default: 0
      'more':
        type: Boolean
        default: false

    data: ->
      formatText: ''
      clickable: false

    computed:
      paragraphs: ->
        return @formatText.split(/\n+/g)

      textStyle: ->
        'cursor': if @clickable then 'pointer' else 'inherit'

      paragraphStyle: ->
        'textIndent': if @indent then "2em" else 0
        'marginTop': @gap + 'px'

    created: ->
      @format()

    watch:
      'text': -> @format()

    methods:
      format: ->
        text = @trim(@text)
        if @isOver(text)
          text = text.slice(0, @limit)
          text = @addHint(text)
          @clickable = @more
        @formatText = text

      isOver: (text) ->
        len = text.length
        return @limit and len > @limit

      trim: (text) ->
        return @model.assets.trim(text)

      addHint: (text) ->
        if(@more)
          return "#{text} ... (more)"
        else
          return "#{text}..."

      click: ->
        if @more
          text = @trim(@text)
          @formatText = text
          @clickable  = false
</script>


<style lang="less">
  .text-area{
    line-height: 20px;
    text-align: justify;
    font-size: 13px;
    color: #273340;
    .paragraph{
      line-height: inherit;
      text-align: inherit;
      font-size: inherit;
      color: inherit;
      &:first-child{
        margin-top: 0 !important;
      }
    }
  }
</style>
