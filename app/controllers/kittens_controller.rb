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
    
  end

  def create
    @kitten = Kitten.create(kittens_params)
    if @kitten.save
      redirect_to @kitten, alert: "Kitten created successfully."
    else
      redirect_to new_kitten_path, alert: "Error creating kitten."
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
    redirect_to kittens_path, :notice => "Your kitten has been deleted"
  end

  private

    def kittens_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
