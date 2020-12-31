json.set! :memos do
  json.array! @memos do |memo|
    json.extract! memo, :id, :title, :body, :is_done, :created_at, :updated_at
  end
end