module.exports = install: (Vue) -> Vue.mixin({

  beforeDestroy: ->
    if(@deinit) then @deinit()

  deactivated: ->
    if(@deinit) then @deinit()

})