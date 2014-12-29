class CategoriesController < ApplicationController
  
  def show
    @category = Category.find(params[:id])
    @posts =  Kaminari.paginate_array(@category.posts.sort_by{|x| x.published_at }.reverse).page(params[:page]).per(12)
    set_meta_tags title: @category.name
    render :template => 'posts/index'
  end
  
end
      