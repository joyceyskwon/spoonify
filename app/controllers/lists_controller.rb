class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.fine(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new
    if @list.valid?
      redirect_to @list
    else
      flash[:notice] = 'Please try again'
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(list_params)
    if @list.valid?
      redirect_to @list
    else
      flash[:notice] = 'Please try again'
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:user_id, :list_name, :public)
  end

end # end of ListsController
