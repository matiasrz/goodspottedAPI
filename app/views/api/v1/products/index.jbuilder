json.array! products do |product|
  json.partial! 'api/v1/products/partials/row', product: product
end
