class Trip < ApplicationRecord
  belongs_to :correspondance
  belongs_to :host, class_name: "User"

  def end_date
    enddate = self.start_date + self.duration.days
    return enddate
  end

  def participants
    self.correspondance.friends
  end

end
