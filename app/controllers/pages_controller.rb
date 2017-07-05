class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
    @page_title = "Devcamp | Home"
  end

  def about
    @page_title = "Devcamp | About"
  end

  def contact
    @phone = 'No phone listed (change this in the controller)'
    @email = 'No email listed (change this in the controller)'
    @page_title = "Devcamp | Contact"
  end
end
