json.extract! @exam, :id, :name, :description, :valid_from, :valid_to, :timespan,  :created_at, :updated_at,:average_difficulty
json.questions @exam.questions
json.provider @exam.teacher.name
