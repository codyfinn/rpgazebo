class User < ApplicationRecord
  has_many :games
  
  def self.from_omniauth(auth:)
    find_by(provider: auth["provider"], uid: auth["uid"]) || create_with_omniauth(auth: auth)
  end

  def self.create_with_omniauth(auth:)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
