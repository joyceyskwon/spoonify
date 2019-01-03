class StaticPagesController < ApplicationController
  skip_before_action :authorized, only: :home
  def home
    @lists = List.all
  end
end # end of StaticPagesController
