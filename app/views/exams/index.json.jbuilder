json.array!(@exams) do |exam|
  json.extract! exam, :id, :name, :description, :valid_from, :valid_to, :timespan, :teacher_id
  json.url exam_url(exam, format: :json)
end
