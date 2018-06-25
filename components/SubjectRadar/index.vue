<template lang="jade">
   .SubjectRadar
      Tip(:text="text" auto): Radar(:items="items")
</template>



<script lang="coffee">
   module.exports =


      components:
         'Radar': require('~/components/Radar').default
         'Tip':   require('~/components/Tip').default


      props:
         'subject':
            type: Object
            required: true


      computed:
         world: -> @subject.world ? 0
         story: -> @subject.story ? 0
         roles: -> @subject.roles ? 0
         paint: -> @subject.paint ? 0
         music: -> @subject.music ? 0

         items: ->
            switch @subject.type

               when 'comic', 'paint'
                  return [{ text: io.formatScore('world'), data: @world }
                          { text: io.formatScore('story'), data: @story }
                          { text: io.formatScore('roles'), data: @roles }
                          { text: io.formatScore('paint'), data: @paint }]

               when 'anime', 'movie'
                  return [{ text: io.formatScore('world'), data: @world }
                          { text: io.formatScore('story'), data: @story }
                          { text: io.formatScore('roles'), data: @roles }
                          { text: io.formatScore('paint'), data: @paint }
                          { text: io.formatScore('music'), data: @music }]


         text: ->
            texts = []

            switch @subject.type

               when 'comic', 'paint'
                  if @world then texts.push("≈ #{@world}% 的人喜欢〖 #{io.formatScore('world')} 〗")
                  if @story then texts.push("≈ #{@story}% 的人喜欢〖 #{io.formatScore('story')} 〗")
                  if @roles then texts.push("≈ #{@roles}% 的人喜欢〖 #{io.formatScore('roles')} 〗")
                  if @paint then texts.push("≈ #{@paint}% 的人喜欢〖 #{io.formatScore('paint')} 〗")

               when 'anime', 'movie'
                  if @world then texts.push("≈ #{@world}% 的人喜欢〖 #{io.formatScore('world')} 〗")
                  if @story then texts.push("≈ #{@story}% 的人喜欢〖 #{io.formatScore('story')} 〗")
                  if @roles then texts.push("≈ #{@roles}% 的人喜欢〖 #{io.formatScore('roles')} 〗")
                  if @paint then texts.push("≈ #{@paint}% 的人喜欢〖 #{io.formatScore('paint')} 〗")
                  if @music then texts.push("≈ #{@music}% 的人喜欢〖 #{io.formatScore('music')} 〗")

            return texts.join('\n')
</script>



<style lang="less">
   .SubjectRadar {
      .Radar {
         width: 100%;
      }
   }
</style>