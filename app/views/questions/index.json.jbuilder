json.array!(@questions) do |question|
  json.extract! question, :id, :title, :description
  json.options question.options.split(",")
  json.answer question.answer.split(",")
  json.extract! question,:multiple, :difficulty
  json.provider question.teacher.name
  json.url question_url(question, format: :json)
end
