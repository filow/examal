json.array!(@students) do |student|
  json.extract! student, :id, :stuid, :name, :sex, :profession, :grade
  json.url student_url(student, format: :json)
end
