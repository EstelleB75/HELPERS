class SearchsController < ApplicationController
  def search
    @category = Category.find_by(name: params[:type])
    @sub_cat = SubCategory.where(category: @category)
  end

  def search_sub_cat
    @sub_cat = SubCategory.find(params[:sub_cat])
    @tags = Tag.where(sub_category: @sub_cat)
  end
  
  def search_tag
    @tag = Tag.find(params[:tag])
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