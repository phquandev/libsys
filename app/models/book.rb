class Book < ActiveRecord::Base

  def self.search(search)
    if search
      Book.where("title LIKE ? OR description LIKE ? OR isbn LIKE ? OR status LIKE ?", "%#{search}%","%#{search}%","%#{search}%","%#{search}%")
    else
      Book.all
    end
  end
end
