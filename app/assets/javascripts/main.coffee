$ ->
  $(document).on 'click', '#photos ul li', (evt) ->
    evt.preventDefault()
    $("li").removeClass('selected')
    $(@).addClass('selected')
    imageLink = $('.selected img').attr('src')
    $('#card_remote_image_url').val(imageLink)

  if $('#tag').val() == ''
    $('#flickr-search').prop 'disabled', true
  $('#tag').keyup ->
    if $('#tag').val() != ''
      $('#flickr-search').prop 'disabled', false
    else
      $('#flickr-search').prop 'disabled', true
