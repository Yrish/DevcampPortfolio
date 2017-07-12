class PortfoliosController < ApplicationController
    before_action :set_portfolio, only: [:edit, :update, :show, :destroy]
    before_action :set_page_title, only: [:edit, :update, :show]
    layout 'portfolio'
    access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
    
    def index
       @portfolio_items = Portfolio.by_position
       @page_title = "Devcamp | Portfolios"
    end
    
    def new
        @portfolio_item = Portfolio.new
        3.times {@portfolio_item.technologies.build}
        @page_title = "Devcamp | New Portfolio"
    end
    
    def create
        @portfolio = Portfolio.new(portfolio_params)
        
        respond_to do |format|
            if @portfolio.save
                format.html { redirect_to portfolios_path, notice: "You just created your own portfolio!" }
            else
                format.html {render :new }
            end
        end
    end
    
    def edit
        3.times {@portfolio_item.technologies.build}
    end
    
    def update
        
        respond_to do |format|
            if @portfolio_item.update(portfolio_params)
                format.html {redirect_to portfolios_path, notice: "The portfolio was updated!" }
            else
                format.html {render :edit }
            end
        end
    end
    
    def show
    end
    
    def destroy
       
       
       #destroy record
       @portfolio_item.destroy
       
       #redirect
       respond_to do |format|
           format.html {redirect_to portfolios_path, notice: "Portfolio was destroyed" }
           format.json { head :no_content }
       end
    end
    
    def sort
        params[:order].each do |key, value|
           Portfolio.find(value[:id]).update(position: value[:position]) 
        end
        
        head :ok
    end
    
    #These are methods for common code
    private
        def portfolio_params
            params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
        end
        
        def set_portfolio
           @portfolio_item = Portfolio.find(params[:id])
        end
        
        def set_page_title
           @page_title = "Devcamp | #{@portfolio_item.title}" 
        end
end