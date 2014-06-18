json.array!(@exams) do |exam|
  json.extract! exam, :id, :name, :description, :valid_from, :valid_to, :timespan,:average_difficulty
  json.questions exam.questions
  json.provider exam.teacher.name
  json.url exam_url(exam, format: :json)
end
