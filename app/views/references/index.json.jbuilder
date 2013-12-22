json.array!(@references) do |reference|
  json.extract! reference, :id, :ref, :fact_id
  json.url reference_url(reference, format: :json)
end
