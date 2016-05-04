class VisitorsController < ApplicationController

  def new
    # Rails.logger.debug 'DEBUG: entering new method'
    @visitor = Visitor.new
    # Rails.logger.debug 'DEBUG: Owner name is ' + @owner.name
    # raise 'Deliberate Failure'

    # flash.now[:notice] = 'Welcome!'
    # flash.now[:alert] = 'My birthday is soon!'
    # <div class="notice">Welcome!</div>
    #c<div class="alert">My birthday is soon.</div>
  end

  def create
    @visitor = Visitor.new(secure_params)

    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Signed up #{@visitor.email}."
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def secure_params
    params.require(:visitor).permit(:email)
  end

end