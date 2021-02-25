class AssosController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query"
      @assos = policy_scope(Asso.where(sql_query, query: "%#{params[:query]}%"))
    else
      @assos = policy_scope(Asso)
    end
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
    params.require(:asso).permit(:name, :city, :description, :email, :photo)
  end
end
