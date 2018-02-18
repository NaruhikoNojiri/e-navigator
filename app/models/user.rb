class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum gender: [:man, :woman]

  def culc_age
    (Date.today.strftime("%Y%m%d").to_i - self.birth_date.strftime("%Y%m%d").to_i) / 10000 unless self.birth_date.nil? 
  end
end
