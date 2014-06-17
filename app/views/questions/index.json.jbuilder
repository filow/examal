json.array!(@questions) do |question|
  json.extract! question, :id, :title, :description, :options, :teacher_id, :answer, :multiple, :difficulty
  json.url question_url(question, format: :json)
end
