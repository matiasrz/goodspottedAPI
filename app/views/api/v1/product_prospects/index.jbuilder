json.count prospects_count
json.list prospects do |prospect|
  json.partial! 'api/v1/product_prospects/partials/row', prospect: prospect
end
