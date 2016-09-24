class Question < ApplicationRecord
  has_many :answers, -> {order('cast(points as int) desc')}

  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end

end
