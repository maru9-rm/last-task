class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_name

  has_one :profile,  serializer: ProfileSerializer
end
