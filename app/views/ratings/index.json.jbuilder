json.array!(@ratings) do |rating|
  json.extract! rating, :id, :texxt_review, :rating_number
  json.url rating_url(rating, format: :json)
end
