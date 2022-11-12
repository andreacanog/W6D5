class CatsController < ApplicationController

    def index
        @kitties = Cat.all 
        render :index
    end

    def show
        @kitty = Cat.find_by(id: params[:id])
        render :show
    end

    def update
        kitty = Cat.find_by(id: params[:id])
        if kitty.update?(cat_params)
            redirect_to cat_url
        else 
            render json: cat.errors.full_messages, status: 422
        end
    end

    def create
        @kitty = Cat.new(cat_params)
        if @kitty.save
            redirect_to cat_url(@kitty)
        else 
            render :new
        end
    end

    def edit
        @kitty = Cat.find_by(id: params[:id])
        render :edit
    end

    def new
        @kitty = Cat.new
        render :new
    end



    private

    def cat_params
        params.require(:cats).permit(:name, :color, :birth_date, :sex, :description)
    end

end