class PortfoliosController < ApplicationController
    def index
       @portfolio_items = Portfolio.all
    end
    
    def new
        @portfolio_item = Portfolio.new
        3.times {@portfolio_item.technologies.build}
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
       @portfolio_item =  Portfolio.find(params[:id])
    end
    
    def update
        @portfolio_item = Portfolio.find(params[:id])
        
        respond_to do |format|
            if @portfolio_item.update(portfolio_params)
                format.html {redirect_to portfolios_path, notice: "The portfolio was updated!" }
            else
                format.html {render :edit }
            end
        end
    end
    
    def show
        @portfolio_item = Portfolio.find(params[:id])
    end
    
    def destroy
        #perform lookup
       @portfolio_item = Portfolio.find(params[:id]) 
       
       
       #destroy record
       @portfolio_item.destroy
       
       #redirect
       respond_to do |format|
           format.html {redirect_to portfolios_path, notice: "Portfolio was destroyed" }
           format.json { head :no_content }
       end
    end
    
    #These are methods for common code
    private
        def portfolio_params
            params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
        end
        
        def set_portfolio
           return 
        end
end