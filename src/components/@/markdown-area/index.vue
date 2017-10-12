<template lang="jade">
  .markdown-area(v-html="html")
</template>


<script lang="coffee">
  marked = require('marked/lib/marked')
  renderer = new marked.Renderer()

  renderer.link = (href, title, text) ->
    if /(jpg)|(jpeg)|(png)|(gif)$/i.test(href)
      return renderer.image(href)

    text ?= href
    return "<a href='#{href}'>#{text}</a>"

  renderer.image = (href, title, text) ->
    hash = href
    if not /^(http|https)/i.test(href)
      href = "#{cdn}/pictures/#{hash}"
    return "
      <div class='image'>
        <img src='#{href}'/>
        <div class='desc'>#{text ? ''}</div>
      </div>
    "

  marked.setOptions({
    renderer: renderer
    gfm: true
  })

  module.exports =
    components:
      'c-button': require('components/@/button')

    props:
      'content':
        type: String
        required: true

    computed:
      html: -> marked(@content)
</script>


<style lang="less">
  .markdown-area{
    width: 100%;
    word-break: break-all;

    *{
      font-size: 13px;
      color: #273340;
    }

    >*:not(:last-child){
      line-height: 20px;
      margin-bottom: 14px;
    }

    em{
      font-weight: bold;
      font-style: normal;
      color: black !important;
    }

    a{
      color: #2F9C95;
      &:hover{
        text-decoration: underline;
      }
    }

    .image{
      width: 100%;
      img{
        display: inline-block;
        max-width: 100%;
      }
      .desc{
        font-size: 13px;
        color: #888;
      }
    }

    ul, ol{
      margin-left: 1.5em;
    }

    blockquote{
      box-sizing: border-box;
      padding: 11px 16px;
      font-size: 0.9375em;
      background-color: #F5F5F5;
    }
  }
</style>
