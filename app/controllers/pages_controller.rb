class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
    @page_title = "#{@name} | Home"
  end

  def about
    @page_title = "#{@name} | About"
  end

  def contact
    @phone = 'No phone listed (change this in the controller)'
    @email = 'No email listed (change this in the controller)'
    @page_title = "#{@name} | Contact"
  end
  
  def nilpage
    
  end
end
