class Message < ActiveRecord::Base
  belongs_to :user

  #vérifier d'un utilisateur est connecté
  validates :user_id, presence: true

end
