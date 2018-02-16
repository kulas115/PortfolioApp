class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :destroy, :show]
  layout 'portfolio'
  access all: [:show, :index, :angular], user: { except: [:destroy, :new, :create, :update, :edit, :sort] }, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order]. each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    head :ok #stating that we are aware no templates are present for this
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def show
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    if @portfolio_item.save
      redirect_to portfolios_path, notice: 'Your portfolio item is now live.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @portfolio_item.update(portfolio_params)
      redirect_to portfolios_path, notice: 'The record successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @portfolio_item.destroy
    redirect_to portfolios_path, notice: 'Portfolio was destroyed'
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy]
                                     )
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
