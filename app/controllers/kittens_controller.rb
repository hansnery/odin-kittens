class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.create(kittens_params)
    if @kitten.save
      flash[:notice] = "Kitten created successfully."
      redirect_to @kitten
    else
      flash[:notice] = "Error creating kitten."
      redirect_to new_kitten_path
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to(@kitten)
    else
      render "edit"
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy!
    flash[:notice] = "Your kitten has been deleted"
    redirect_to kittens_path
  end

  private

    def kittens_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
