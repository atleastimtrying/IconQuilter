class App
  constructor: ->
    @input = new Input @
    @canvas = $ 'canvas'
    @resize()
    @ctx = @canvas[0].getContext('2d')
    @currentX = 0
    @currentY = 0
    @canvas.click @saveImage

  imgsrc: (username)-> "http://api.twitter.com/1/users/profile_image/#{username}.png"

  getImgs: (name)->
    $.get "/followers/#{name}.json", (data) =>
      if data.followers
        columnAmount = Math.floor @canvas[0].width/48
        rowAmount  = Math.ceil data.followers.length/columnAmount
        @canvas[0].height = rowAmount * 48
        @drawImg username for username in data.followers
      else
        @input.showWindow({error:"#{username} doesn't seem to work!"})

  resize: =>
    @canvas[0].width = $(window).width()
    @canvas[0].height = $(window).height()

  drawImg: (username)=>
    img = new Image()
    img.src = @imgsrc username
    img.onload = =>
      @ctx.drawImage img, @currentX, @currentY, 48, 48
      @currentX += 48
      if @currentX > @canvas[0].width - 48
        @currentX = 0
        @currentY += 48

$ -> window.app = new App