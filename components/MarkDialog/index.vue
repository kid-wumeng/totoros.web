<template lang="jade">
   Modal.MarkDialog(hide-close)
      Column
         Title(:subject="subject")
         Step(v-model="step")
         Score(v-model="score" v-if="scoreOpen")
         Row.items(x="center"  v-if="itemsOpen")
            Item(v-model="world" name="world")
            Item(v-model="story" name="story")
            Item(v-model="roles" name="roles")
            Item(v-model="paint" name="paint")
            Item(v-model="music" name="music" v-if="musicOpen")
         Content(v-model="content")
         ActionBar(:mark="mark" @remove="remove" @cancel="cancel" @update="update" @create="create")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Modal':     require('~/components/Modal').default
         'Row':       require('~/components/Row').default
         'Column':    require('~/components/Column').default
         'Title':     require('./Title').default
         'Step':      require('./Step').default
         'Score':     require('./Score').default
         'Item':      require('./Item').default
         'Content':   require('./Content').default
         'ActionBar': require('./ActionBar').default

      props:
         'subject':
            type: Object
            required: true

         'mark':
            type: Object
            default: null

         'defaultStep':
            type: Number
            default: 1
            validator: (step) => [1, 2, 3].includes(step)

      data: ->
         'step':    @mark?.step    ? @defaultStep
         'score':   @mark?.score   ? 0
         'world':   @mark?.world   ? false
         'story':   @mark?.story   ? false
         'roles':   @mark?.roles   ? false
         'paint':   @mark?.paint   ? false
         'music':   @mark?.music   ? false
         'content': @mark?.content ? ''

      computed:
         scoreOpen: -> [2, 3].includes(@step)
         itemsOpen: -> [2, 3].includes(@step)
         musicOpen: -> ['anime', 'movie'].includes(@subject.type)

      methods:
         remove: -> @$emit('remove')
         cancel: -> @$emit('cancel')
         update: -> @$emit('update', @getData())
         create: -> @$emit('create', @getData())

         getData: ->
            return
               step:    @step
               score:   @score
               world:   @world
               story:   @story
               roles:   @roles
               paint:   @paint
               music:   @music
               content: @content
</script>



<style lang="less">
   .MarkDialog {
      background-color: rgba(255, 255, 255, 0.9) !important;

      > .Column {
         width: 600px;

         > * {
            margin-bottom: 34px;
            &:last-child {
               margin-bottom: 0;
            }
         }

         > .Row.items {
            > .Item {
               margin-right: 24px;
               &:last-child {
                  margin-right: 0;
               }
            }
         }
      }
   }
</style>