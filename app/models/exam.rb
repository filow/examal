class Exam < ActiveRecord::Base
	validates_presence_of :name,:teacher_id,message:"不能为空"
	validates_numericality_of :timespan
	belongs_to :teacher
end
