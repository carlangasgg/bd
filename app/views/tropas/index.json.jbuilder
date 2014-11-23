json.array!(@tropas) do |tropa|
  json.extract! tropa, :id, :nombre, :costo, :ataque, :defensa, :num_guerreros, :historia
  json.url tropa_url(tropa, format: :json)
end
