class ClientSerializer < ActiveModel::Serializer
  attributes :name , :age, :total

# getting the total charge of the client
  def total
  object.memberships.sum(:charge)
  end
end
