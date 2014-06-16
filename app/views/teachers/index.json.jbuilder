json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :hashed_password, :salt, :is_admin
  json.url teacher_url(teacher, format: :json)
end
