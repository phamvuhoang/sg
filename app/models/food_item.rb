class FoodItem < ApplicationRecord
  belongs_to :menu_type

  def self.search(search, menu_type)
    if (search != "")
      if menu_type == -1
        where("name ILIKE ?", "%#{search}%") 
      else
        where("name ILIKE ? and menu_type_id = ?", "%#{search}%", menu_type)
      end
    else
      where("menu_type_id = ?", menu_type)
    end
  end


end
