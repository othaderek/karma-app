class DeedsController < ApplicationController

  def index
    @deeds = Deed.all
  end

  def new

  end

  def create

  end
end
