class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride
    flash = {}
    @user = self.user
    if meet_requirements
      @user.rides << self
      @user.update(
        :tickets => @user.tickets - self.attraction.tickets,
        :nausea => @user.nausea + self.attraction.nausea_rating,
        :happiness => @user.happiness + self.attraction.happiness_rating
      )
      flash[:notice] = "Thanks for riding the #{self.attraction.name}!"
    elsif tall_enough && !enough_tickets
      flash[:notice] = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif enough_tickets && !tall_enough
      flash[:notice] = "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      flash[:notice] = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end
  end

  private

  def meet_requirements
    enough_tickets && tall_enough
  end

  def enough_tickets
    @user.tickets > self.attraction.tickets
  end

  def tall_enough
      @user.height > self.attraction.min_height
  end


end
