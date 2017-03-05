$ ->
  fieldsCount = undefined
  maxFieldsCount = 24
  $addLink = $('a.add_nested_fields')

  toggleAddLink = ->
    $addLink.toggle fieldsCount <= maxFieldsCount
    return

  $(document).on 'nested:fieldAdded', ->
    fieldsCount += 1
    toggleAddLink()
    return
  $(document).on 'nested:fieldRemoved', ->
    fieldsCount -= 1
    toggleAddLink()
    return
  # count existing nested fields after page was loaded
  fieldsCount = $('form .fields').length
  toggleAddLink()
  return