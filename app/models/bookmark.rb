class Bookmark < ActiveRecord::Base
	belongs_to :user

	#vérifier d'un utilisateur est connecté
	validates :user_id, presence: true

	#Vérifier que le titre est présent et qu'il fait au moins 5 caractères
	validates :title, length: {minimum: 5}, presence: true

	

	

end
