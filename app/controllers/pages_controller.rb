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
    @page_title = "Devcamp | Contact"
  end
end
