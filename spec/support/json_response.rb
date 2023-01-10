module JsonResponse
  def json_attributes(response)
    JSON.parse(response.body)['data']['attributes']
  end

  def error_message(response)
    JSON.parse(response.body)['error']
  end
end
