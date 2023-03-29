module JsonResponse
  def json_attributes(response)
    JSON.parse(response.body)
  end

  def json_collection(response)
    JSON.parse(response.body)['data']
  end

  def error_message(response)
    JSON.parse(response.body)['error']
  end
end
