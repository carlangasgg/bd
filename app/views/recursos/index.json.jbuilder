json.array!(@recursos) do |recurso|
  json.extract! recurso, :id, :nombre
  json.url recurso_url(recurso, format: :json)
end
