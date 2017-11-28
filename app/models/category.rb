class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true, inclusion: { in: ["Terrasse & Jardin", "Salle de bains", "Cuisine", "Rangement & Dressing", "Matériaux & Menuiserie", "Carrelage, parquet & sol", "Décoration & Eclairage", "Peinture & Droguerie", "Electricité & Domotique", "Chauffage & Plomberie", "Quincaillerie", "Outillage"]}
end
