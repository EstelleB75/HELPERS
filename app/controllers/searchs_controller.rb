class SearchsController < ApplicationController
  def search
    @category = Category.find_by(name: params[:type])
    @sub_cat = SubCategory.where(category: @category)
  end

  def search_sub_cat
    @category = Category.find(params[:category])
    if params[:sub_cat]
      @sub_cat = SubCategory.find(params[:sub_cat])
      @tags = Tag.where(sub_category: @sub_cat)
    else
      redirect_to search_path(params: { type: @category.name })
      flash[:alert] = "Vous devez selectionner un tag"
    end
  end

  def search_tag
    @sub_cat = SubCategory.find(params[:sub_cat])
    if params[:tag]
      @tag = Tag.find(params[:tag])
    else
      redirect_to search_sub_cat_path(params: { sub_cat: @sub_cat.id, category: @sub_cat.category.id })
      flash[:alert] = "Vous devez selectionner un tag"
    end
  end

  def search_address
    @address = params[:address]
    @tag = Tag.find(params[:tag])
    @asso_tag = AssociationTag.where(tag: @tag)
    arr = []
    @asso_tag.each do |asso_tag|
      arr << Asso.find(asso_tag.asso.id)
    end
    @assos = arr.uniq
  end
end
