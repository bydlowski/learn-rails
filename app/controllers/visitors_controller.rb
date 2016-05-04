class VisitorsController < ApplicationController

  def new
    Rails.logger.debug 'DEBUG: entering new method'
    @owner = Owner.new
    Rails.logger.debug 'DEBUG: Owner name is ' + @owner.name
    # raise 'Deliberate Failure'

    flash.now[:notice] = 'Welcome!'
    flash.now[:alert] = 'My birthday is soon!'
    # <div class="notice">Welcome!</div>
    #c<div class="alert">My birthday is soon.</div>
  end

end