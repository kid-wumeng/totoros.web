<template lang="jade">
  .text-area(v-if="text", :class="textClass")
    .paragraph(v-for="paragraph in paragraphs", :style="paragraphStyle", v-html="paragraph", @click="click")
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
      formatTexts: []
      unfold: false
      clickable: false

    computed:
      paragraphs: -> @formatTexts

      textClass: ->
        '-clickable': @clickable

      paragraphStyle: ->
        'marginTop': @gap + 'px'
        'textIndent': if @indent then '2em' else 0

    created: ->
      @format()

    watch:
      'text': -> @format()

    methods:
      format: ->
        text = @trim(@text)
        if @isOver(text) and !@unfold
          text = text.slice(0, @limit)
          text = @addHint(text)
          @clickable = @more
        texts = text.split(/\n/)
        @formatTexts = texts

      isOver: (text) ->
        len = text.length
        return @limit and len > @limit

      trim: (text) ->
        return @model.assets.trim(text)

      addHint: (text) ->
        if(@more)
          return "#{text}... (more)"
        else
          return "#{text}..."

      click: ->
        if(@more)
          @unfold = true
          @format()
          @clickable = false
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
    .paragraph:empty{
      height: 12px;
    }
  }
  .text-area.-clickable{
    cursor: pointer;
  }
</style>
