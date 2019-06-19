class DeedsController < ApplicationController

  def index
    @deeds = Deed.all
  end

  def new
    @deed = Deed.new
  end

  def create
    @deed = Deed.create(deed_params)
    if @deed.valid?
      redirect_to deeds_path
    else
      flash[:errors] = @deed.errors.full_messages
      render new_deed_path
    end
  end

  private

  def deed_params
    params.require(:deed).permit(:item)
  end
end
