class MessageSerializer < ActiveModel::Serializer
  attributes :text, :date

  #belongs_to :user, UserSerializer

  def date
    object.created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
