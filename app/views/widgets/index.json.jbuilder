json.array!(@widgets) do |widget|
  json.extract! widget, :id, :partial, :x, :y, :system
  json.url widget_url(widget, format: :json)
end
