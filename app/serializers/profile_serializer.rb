class ProfileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :avatar_image
  belongs_to :user

  def avatar_image
    url_for(object.avatar)
  end
end
