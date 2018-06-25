<template lang="jade">
   .TextArea(v-if="html" v-html="text")
   .TextArea(v-else)
      p(v-for="(p, i) in ps", :key="i") {{ p }}
</template>



<script lang="coffee">


   formatAs            = require('./formatAs')
   formatSubjectGroups = require('./formatSubjectGroups')
   formatUsers         = require('./formatUsers')


   module.exports =


      props:
         'text':
            type: String
            default: ''

         'html':
            type: Boolean
            default: false

         'indent':
            type: Boolean
            default: false


      computed:
         ps: ->
            return @text.trim().split(/\n+/)


      mounted: ->
         @format()


      updated: ->
         @format()


      methods:
         format: ->
            if @html
               formatAs( textArea = @$el )
               formatSubjectGroups( textArea = @$el )
               formatUsers( textArea = @$el )
</script>



<style lang="less">
   .TextArea {
      line-height: 24px;
      font-size: 14px;
      word-break: break-all;

      > h1,
      > h2,
      > h3,
      > h4,
      > h5,
      > h6           { margin-bottom: 20px }
      > p            { margin-bottom: 16px }
      > blockquote   { margin-bottom: 16px }
      > ul           { margin-bottom: 16px }
      > ol           { margin-bottom: 16px }
      > *:last-child { margin-bottom: 0 }

      > h1,
      > h2,
      > h3,
      > h4,
      > h5,
      > h6 {
         font-weight: 600;
         font-size: 24px;
         &:not(:first-child) {
            margin-top: 40px;
         }
      }

      > blockquote {
         padding: 0.8em 1.1em;
         color: #A2AEBA;
         border: 1px dashed #A2AEBA;
      }

      > ul,
      > ol {
         margin-left: 1.5em;
      }

      strong {
         font-weight: 600;
         color: red;
      }

      em {
         font-weight: 600;
         font-style: normal;
      }

      a {
         font-weight: 600;
         color: #3A97FC;
         &:hover{
          text-decoration: underline;
         }
      }

      user {
         display: inline-block;
         font-weight: 600;
         color: #3A97FC;
         cursor: pointer;
         &:hover{
          text-decoration: underline;
         }
      }

      subject-group {
         display: block;

         subject {
            display: block;

            face {
               display: block;
            }

            name {
               display: block;
            }

            desc {
               display: block;
            }
         }
      }
   }
</style>