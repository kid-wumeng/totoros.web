<template lang="jade">
  .markdown-area(v-html="html")
</template>


<script lang="coffee">
  marked = require('marked/lib/marked')
  renderer = new marked.Renderer()


  parseCard = (url, text) ->
    query = model.assets.parseUrl(url).query
    query = model.assets.parseQuery(query)
    data  = query
    data.name = text
    return data


  renderSubjectCard = (url, text) ->
    data   = parseCard(url, text)
    type   = model.subject.displayType(data.type)
    season = if data.season then "Season #{data.season}" else ''
    card   =
      path: "subjects/#{data.id}"
      face: "subjects/#{data.id}/face?v=#{data['face.version']}"
      name: data.name
      subs: [type, season].filter((item) -> item)
    return renderCard(card)


  renderRoleCard = (url, text) ->
    data = parseCard(url, text)
    card =
      path: "roles/#{data.id}"
      face: "roles/#{data.id}/face?v=#{data['face.version']}"
      name: data.name
      subs: ['角色']
    return renderCard(card)


  renderPersonCard = (url, text) ->
    data = parseCard(url, text)
    year = data.year ? ''
    card =
      path: "persons/#{data.id}"
      face: "persons/#{data.id}/face?v=#{data['face.version']}"
      name: data.name
      subs: ['人物', year].filter((item) -> item)
    return renderCard(card)


  renderOrganizationCard = (url, text) ->
    data = parseCard(url, text)
    year = data.year ? ''
    card =
      path: "organizations/#{data.id}"
      face: "organizations/#{data.id}/face?v=#{data['face.version']}"
      name: data.name
      subs: ['团体', year].filter((item) -> item)
    return renderCard(card)


  renderCard = (card) ->
    onclick   = "window.router.push('/#{card.path}')"
    faceUrl   = "#{cdn}/#{card.face}"
    faceStyle = "background-image: url(#{faceUrl})"
    return "
      <div class='card' onclick=\"#{onclick}\">
        <div class='left'>
          <div class='face' style='#{faceStyle}'></div>
        </div>
        <div class='right'>
          <div class='name'>#{card.name}</div>
          <div class='subs'>#{card.subs.join(' / ')}</div>
        </div>
      </div>
    "



  renderer.link = (url, title, text) ->
    if /(jpg)|(jpeg)|(png)|(gif)$/i.test(url)
      return renderer.image(url)

    switch
      when /^(subject)/.test(url)      then return renderSubjectCard(url, text)
      when /^(role)/.test(url)         then return renderRoleCard(url, text)
      when /^(person)/.test(url)       then return renderPersonCard(url, text)
      when /^(organization)/.test(url) then return renderOrganizationCard(url, text)

    text ?= url
    return "<a href='#{url}' target='_blank'>#{text}</a>"


  renderer.image = (url, title, text) ->
    hash = url
    if not /^(http|https)/i.test(url)
      url = "#{cdn}/pictures/#{hash}"
    return "
      <div class='image'>
        <img src='#{url}'/>
        <div class='desc'>#{text ? ''}</div>
      </div>
    "


  marked.setOptions({
    renderer: renderer
    gfm: true
    breaks: true
  })

  module.exports =
    components:
      'c-button': require('components/@/button')

    props:
      'content':
        type: String
        default: ''

    computed:
      html: ->
        html = marked(@content)
        html = html.replace(/<br>/g, '')
        return html
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
      margin-bottom: 14px;
    }

    p{
      line-height: 20px;
    }

    em{
      font-weight: bold;
      font-style: normal;
      color: black !important;
    }

    a{
      font-weight: 600;
      color: #3db8c1;
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
