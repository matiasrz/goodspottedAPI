json.array! stores do |store|
  json.partial! 'api/v1/stores/partials/row', store: store
end
