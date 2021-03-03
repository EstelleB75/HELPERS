class AssosController < ApplicationController
  def index
    @assos_name = Asso.pluck(:name).sort
    @subcats = SubCategory.all
    if params[:query].present?
      sql_query = "name ILIKE :query"
      @assos = policy_scope(Asso.with_attached_photo.includes(association_tags: {tag: :sub_category}).where(sql_query, query: "%#{params[:query]}%"))
    else
      @assos = policy_scope(Asso.with_attached_photo.includes(association_tags: {tag: :sub_category}))
    end
  end

  def results
    policy_scope(Asso)
    @assos = AssociationTag.all.map { |asso_tag| Asso.find(asso_tag.asso.id) }
  end

  def show
    @asso = Asso.find(params[:id])
    authorize @asso
  end

  def new
    @asso = Asso.new
    authorize @asso
  end

  def create
    @asso = Asso.create(asso_params)
    @asso.save
    authorize @asso
  end

  def edit
    @asso = Asso.find(params[:id])
    authorize @asso
  end

  def update
    @asso = Asso.find(params[:id])
    @asso.update(asso_params)
    authorize @asso
  end

  def delete
    @asso = Asso.find(params[:id])
    @asso.destroy
    authorize @asso
  end

  private

  def asso_params
    params.require(:asso).permit(:name, :city, :description, :email, :photo, :phone_number, :address, :website)
  end
end
