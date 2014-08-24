class window.SlidePager
  constructor: (options) ->
    @$body  = $("body")
    @number = 1111
    # @beforeState  = []
  shiftRight: ->
    @selectPanel("right")
    # @mover("right","left")

  shiftLeft: ->
    @selectPanel("left")
    # @mover("left","right")

  shiftUp: ->
    @selectPanel("up")
    # @mover("up","down")

  shiftDown: ->
    @selectPanel("down")
    # @mover("down","up")

  $dataname: (number)->
    return $("[data-js="+number+"]")

  isBack: (latestState) ->
    return @beforeState[@beforeState.length-1] == latestState

  selectPanel: (dir)->
    switch dir
      when "left"
        if parseInt((@number+ "").slice(0,1)) >= parseInt((@number+ "").slice(2,3))
          @movePanel(1000, dir)
        else
          @movePanel(-10, dir)
      when "up"
        if parseInt((@number+ "").slice(1,2)) >= parseInt((@number+ "").slice(3,4))
          @movePanel(100, dir)
        else
          @movePanel(-1, dir)
      when "right"
        if parseInt((@number+ "").slice(2,3)) >= parseInt((@number+ "").slice(0,1))
          @movePanel(10, dir)
        else
          @movePanel(-1000, dir)
      when "down"
        if parseInt((@number+ "").slice(3,4)) >= parseInt((@number+ "").slice(1,2))
          @movePanel(1, dir)
        else
          @movePanel(-100, dir)

  movePanel: (num, dir) ->
    if @$dataname(@number+num).hasClass("pages")
      e = $.Event( "transing" )
      $(window).trigger( e )
      @$dataname(@number).addClass("move"+dir).on "transitionend", =>
        @$dataname(@number-num).removeClass("active")
        @$dataname(@number-num).removeClass("move"+dir)
        e = $.Event( "transfinish" );
        $(window).trigger( e );
      @number += num
      @$dataname(@number).addClass("active")



  # removeactive: (op1, num)->
  #   @$dataname(@number).addClass("move"+op1).on "transitionend", =>
  #     @$dataname(@number-num).removeClass("active")

  # mover: (op1, op2)->

  #   if @isBack(op2)
  #     switch op2
  #       when "up"
  #         console.log @number-100
  #         @removeposition(op2, 100)
  #       when "down"
  #         console.log @number-1
  #         @removeposition(op2, 1)
  #       when "left"
  #         console.log @number-1000
  #         @removeposition(op2, 1000)
  #       when "right"
  #         console.log @number-10
  #         @removeposition(op2, 10)
  #     @beforeState.pop()
  #   else
  #     switch op1
  #       when "up"

  #         if parseInt((@number+ "").slice(1,2)) >= parseInt((@number+ "").slice(3,4))
  #           console.log @number+100
  #           @moveaction(op1,100)
  #         else
  #           console.log @number-1
  #           @moveaction(op1,-1)
  #       when "down"

  #         if parseInt((@number+ "").slice(3,4)) >= parseInt((@number+ "").slice(1,2))
  #           console.log @number+1
  #           @moveaction(op1,1)
  #         else
  #           console.log @number-100
  #           @moveaction(op1,-100)
  #       when "left"

  #         if parseInt((@number+ "").slice(0,1)) >= parseInt((@number+ "").slice(2,3))
  #           console.log @number+1000

  #           @moveaction(op1,1000)
  #           console.log @number
  #         else
  #           console.log @number-10
  #           @moveaction(op1,-10)
  #       when "right"

  #         if parseInt((@number+ "").slice(2,3)) >= parseInt((@number+ "").slice(0,1))
  #           console.log @number+10
  #           @moveaction(op1,10)
  #         else
  #           console.log @number-1000
  #           @moveaction(op1,-1000)


  # removeposition: (op2, num)->
  #   @number -= num
  #   @$dataname(@number+num).css
  #     'z-index':'1'
  #   @$dataname(@number).addClass("active")
  #   @$dataname(@number).removeClass("move"+op2).on "transitionend", =>
  #     @$dataname(@number+num).removeClass("active")

  # moveaction: (op1, num)->
  #   if @$dataname(@number+num).hasClass("pages")
  #     @removeactive(op1, num)
  #     @number += num
  #     @$dataname(@number).addClass("active")
  #     @beforeState.push op1

  # isPosition: (op1, number)->
  #   switch(number + "").split("1").length - 1
  #     when 4
  #       return true
  #     when 3
  #       return true
  #     when 2
  #       switch indexOf(number, "11")
  #         when 0
  #           switch op1
  #             when "up"

  #             when "down"
  #             when "left"
  #             when "right"

  #         when 1
  #         when 2
  #     when 1




  # isIndexOf: (number, val)->
  #   return (number + "").indexOf(val) > -1




