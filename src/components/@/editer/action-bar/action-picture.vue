<template lang="jade">
  file-select(multiple @select="select")
    action.action-picture(icon="fa-picture-o" label="本地图片" @click="select")
</template>


<script lang="coffee">
  module.exports =
    components:
      'file-select': require('components/@/file-select')
      'action':      require('components/@/action')

    methods:
      select: (files) ->
        if(!files or !files.length)
          return

        total = files.length
        count = 0
        @commit('toast/SHOW', "上传图片中，请耐心等待... #{count}/#{total}")

        tasks = []
        allSuccess = true

        for file in files

          complete = =>
            count++
            if count is total
              @commit('toast/HIDE')
            else
              @commit('toast/SHOW', "上传图片中，请耐心等待... #{count}/#{total}")

          done = (picture) =>
            @$emit('add-picture', picture)
            complete()

          fail = (error) =>
            @dispatch('notify/show', {type: 'fail', message: error.message, duration: 3000})
            allSuccess = false
            complete()

          task = @api.task('picture.upload', file).done(done).fail(fail)
          tasks.push(task)

        @api.callSeq(tasks).done =>
          if(allSuccess)
            @dispatch('notify/show', {type: 'done', message: '上传完成'})
</script>