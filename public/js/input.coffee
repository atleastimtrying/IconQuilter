class window.Input
  constructor: (@app)->
    @input = $('input')
    @input.keypress @keyPress
    $('a').click @showWindow
    @showWindow()

  hideWindow: ->
    $('div#username_box').hide();
    $('a').show();
    @input.val ""

  showWindow: (event)->
    $('div#username_box').show();
    if(event.error){
      $('span.error').html event.error
    }else{
      $('span.error').html ""
    }
    $('a').hide();
    false

  keyPress: (event)=>
    if event.keyCode is 13
      @app.getImgs @input.val()
      @hideWindow()
