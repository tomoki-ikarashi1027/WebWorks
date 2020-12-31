json.set! :memo do
  json.extract! @memo, :id, :title, :body, :is_done, :created_at, :updated_at
end