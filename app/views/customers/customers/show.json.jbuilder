json.array!(@order) do |order|
  json.extract! order, :id, :logged_out_on
  json.start order.starts_at
  json.end order.ends_at
end