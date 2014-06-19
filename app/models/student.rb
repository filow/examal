require 'digest/sha2'
class Student < ActiveRecord::Base
	validates_presence_of :stuid,:name,message: "不能为空"
	validates_numericality_of :grade,message: "必须为一个数字",allow_nil: true
	# true-男 false-女
	validates_inclusion_of :sex, in: [true,false],message:"不是一个合法的值",allow_nil: true
	validates_uniqueness_of :stuid,message:"已经存在，请换一个学号"
	attr_reader :password
	validates_length_of :password,minimum: 6,message: "至少要有6位"

	validate :password_must_be_present
	has_many :contests
	has_many :exams,through: :contests
	def self.auth(name,password)
		if student=find_by_name(name)
			if student.hashed_password == encrypt_password(password,name)
				student
			end
		end
	end
	def self.encrypt_password(password,salt)

		Digest::SHA2.hexdigest(password.to_s+salt)
	end
	def password=(password)
		@password=password
		if password.present?
			self.hashed_password = self.class.encrypt_password(password,name)
		end
	end
	private 
	def password_must_be_present
		errors.add(:password,"没有找到") unless hashed_password.present?
	end
end
