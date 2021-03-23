class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :github, :google_oauth2]

  has_one_attached :avatar

after_create_commit :add_default_avatar

  def  avatar_thumbnail
      if avatar.attached?
    avatar.variant(resize: "150x150!").processed 
      else
        "/default.jpeg"

      end
  end 

  private
  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(

          'app', 'assets', 'images' , 'default.jpeg'
          )

        ), filename: 'default.jpeg' ,
        content_type: 'image/jpeg'
      )
    end
  end
   

   def self.create_from_provider_data(provider_data) 
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user| 
    user.email = provider_data.info.email 
    user.password = Devise.friendly_token[0, 20] 
    end
  end

end
