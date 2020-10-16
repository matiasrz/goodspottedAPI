json.array! countries do |country|
  json.partial! 'api/v1/countries/partials/row', country: country
end
