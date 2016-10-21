class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if meet_requirements
      go_on_ride
    elsif tall_enough && !enough_tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end

  private

  def meet_requirements
    enough_tickets && tall_enough
  end

  def enough_tickets
    user.tickets >= attraction.tickets
  end

  def tall_enough
    user.height >= attraction.min_height
  end

  def go_on_ride
    user.update(
      :tickets => (user.tickets - attraction.tickets),
      :nausea => (user.nausea + attraction.nausea_rating),
      :happiness => (user.happiness + attraction.happiness_rating)
    )
  end

end
