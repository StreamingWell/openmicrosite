class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :company, :job, :password, :password_confirmation, :remember_me, :hcp, :nothcp, :reminder, :future
  # attr_accessible :title, :body

  after_create :send_user_and_admin_notification

  private

  	def send_user_and_admin_notification
      AdminMailer.registration_notification(self).deliver
      UserMailer.welcome(self).deliver
  	end
end
