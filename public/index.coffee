$ ->
  currentSlide = 0
  slideElements = $('#Stack').children()

  $('#back').on 'click', ->
    go(currentSlide, currentSlide-1)

  $('#next').on 'click', ->
    go(currentSlide, currentSlide+1)


  go = (from,to) ->
    # only allow slides 0-4
    to = Math.min 4, Math.max(0, to)

    currentSlide = to
    $('#current').text currentSlide

    $(slideElements).removeClass 'current next previous before after'
    for element in slideElements
      elem   = $(element)
      inNum  = elem.data 'in'
      outNum = elem.data 'out'

      # before | previous | current | next | after
      elem.addClass 'current'   if to >= inNum && to < outNum
      elem.addClass 'previous'  if to == outNum
      elem.addClass 'next'      if to + 1 == inNum
      elem.addClass 'before'    if to > outNum
      elem.addClass 'after'     if to < inNum - 1

  go(0,0)

