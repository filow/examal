require 'digest/sha2'
class Teacher < ActiveRecord::Base
	validates_presence_of :name,message:"不能为空"
	validates_uniqueness_of :name,message:"应当是唯一的"
	validates_confirmation_of :password,message: "和密码不匹配"
	validates_length_of :password,minimum: 6,message: "至少要有6位"
	attr_accessor :password_confirmation
	attr_reader :password

	validate :password_must_be_present

	def self.auth(name,password)
		if teacher=find_by_name(name)
			if teacher.hashed_password == encrypt_password(password,teacher.salt)
				teacher
			end
		end
	end

	def self.encrypt_password(password,salt)

		Digest::SHA2.hexdigest(password.to_s+salt)
	end

	def password=(password)
		@password=password
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password,salt)
		end
	end
	private

	def password_must_be_present
		errors.add(:password,"没有找到") unless hashed_password.present?
	end

	def generate_salt
		self.salt=self.object_id.to_s + rand.to_s
	end
end
