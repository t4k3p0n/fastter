# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(window).on 'scroll', ->
  scrollHeight = $(document).height()
  scrollPosition = $(window).height() + $(window).scrollTop()
  if (scrollHeight - scrollPosition) / scrollHeight <= 0.05
    # スクロールの位置が下部5%の範囲に来た場合
    $('.jscroll').jscroll
      contentSelector: '.jscroll'
      nextSelector: 'span.next:last a'
    return
  return

  readURL = (input) ->
  if input.files and input.files[0]
    reader = new FileReader

    reader.onload = (e) ->
      $('.image-upload-wrap').hide()
      $('.file-upload-image').attr 'src', e.target.result
      $('.file-upload-content').show()
      $('.image-title').html input.files[0].name
      return

    reader.readAsDataURL input.files[0]
  else
    removeUpload()
  return

removeUpload = ->
  $('.file-upload-input').replaceWith $('.file-upload-input').clone()
  $('.file-upload-content').hide()
  $('.image-upload-wrap').show()
  return

$('.image-upload-wrap').bind 'dragover', ->
  $('.image-upload-wrap').addClass 'image-dropping'
  return
$('.image-upload-wrap').bind 'dragleave', ->
  $('.image-upload-wrap').removeClass 'image-dropping'
  return