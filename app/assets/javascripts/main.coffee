# $(document).ready ->
#   $('button#flickr').click (evt)->
#       evt.preventDefault()
#       $('#flickr-field').removeClass('hidden-field')
#       $('#image-block').addClass('hidden-field').fadeOut(100)
#
#       $('#flickr-search').click ->
#           flickrAPI = 'https://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?'
#           picture = $("#original_text").val()
#           if picture.length > 0
#               flickrOptions =
#                   tags: picture
#                   format: "json"
#
#               renderPhotos = (data)->
#                   photosHtml = "<ul class=\"results\">"
#                   for photo in data.items
#                       photosHtml = "#{photosHtml} <li class=\"grid-25 tablet-grid-50\">"
#                       photosHtml = "#{photosHtml} <a href=\"#\" class=\"image\">"
#                       photosHtml = "#{photosHtml} <img src=\"#{photo.media.m}\"></a></li>"
#                   photosHtml = "#{photosHtml}</ul>"
#                   $('#photos').html(photosHtml)
#
#                   $('img').click ->
#                       $(@).addClass('hidden-field')
#                       imageLink = $(@).attr('src')
#                       $('#image_url').val(imageLink)
#                       alert imageLink
#
#               $.getJSON(flickrAPI, flickrOptions, renderPhotos)
#               $("#form").val("")
#           else
#               alert "Enter something..."
# $(document).ready ->
#   $('button#flickr').click ->
#       picture = $("#original_text").val()
#       $("#tag").val(picture)


# $(document).ready ->
#   $('button#flickr').click ->
#     $('#flickr-field').removeClass('hidden-field')


# $ ->
#   $('#flickr-search').click (e) ->
#     e.preventDefault()



# $ ->
#   $('form[id=new_link]').submit (e) ->
#     e.preventDefault()
