class CommentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers


  attributes :id, :content

  belongs_to :user,  serializer: UserSerializer

end