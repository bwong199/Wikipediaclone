class Contact < MailForm::Base
	attribute :name, :validate => true
	attribute :email, :validate => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	attribute :message, :validate => true
	attribute :nickname, :captcha => true

	def headers 
		{
		:subject => "Contact Form",
		:to => "bwong199@my.bcit.ca",
		:from => %("#{name}" <#{email}>)
	}
	end
end