class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  attribute :token, if: -> { instance_options[:show_token]}

  def token
    instance_options[:token]
  end
end
