class Model
  @list: (plural) ->
    $.get "/api/#{plural}"

  @add: (plural, object, cb) ->
    $.ajax
      url: "/api/#{plural}"
      type: "POST"
      contentType: "application/json"
      data: JSON.stringify(object)
      success: (data) ->
        cb data
