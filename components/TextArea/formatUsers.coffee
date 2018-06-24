module.exports = formatUsers = ( textArea ) ->

   ########################################
   #|
   #|   @params {HTMLElement} textArea
   #|
   ########################################

   users = textArea.querySelectorAll('user')

   for user in users
      formatUser(user)





formatUser = ( user ) ->

   ########################################
   #|
   #|   @params {HTMLElement} user
   #|
   ########################################

   user.addEventListener 'click', ->
      window.open("/users/#{user.id}")