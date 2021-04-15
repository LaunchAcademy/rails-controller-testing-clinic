class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at

  # has_many :steps
  
  # def name_plus_pokemon
  #   object.name + "squirtle"
  # end
end
