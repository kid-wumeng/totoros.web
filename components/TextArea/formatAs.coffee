module.exports = formatAs = ( textArea ) ->

   ########################################
   #|
   #|   @params {HTMLElement} textArea
   #|
   ########################################

   links = textArea.querySelectorAll('a')

   for a in links
      formatA(a)





formatA = ( a ) ->

   ########################################
   #|
   #|   @params {HTMLElement} a
   #|
   ########################################

   a.setAttribute('target', '_blank')