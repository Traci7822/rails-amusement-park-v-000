module RidesHelper
  def take_ride
    binding.pry
    @user = user
    if @user.tickets && @user.height
      if meet_requirements
        #go_on_ride
      elsif tall_enough && !enough_tickets
        "Sorry. You do not have enough tickets the #{attraction.name}."
      elsif enough_tickets && !tall_enough
        "Sorry. You are not tall enough to ride the #{attraction.name}."
      else
        "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      end
    end
  end

  private

  def meet_requirements
      enough_tickets && tall_enough
  end

  def enough_tickets
      @user.tickets > self.tickets
  end

  def tall_enough
      @user.height > self.min_height
  end
end
