class FruitsController < ApplicationController

    def index
        @fruits = Fruit.all.reverse
    end

    def create
        fruit = Fruit.create fruit_params
        if fruit.persisted?
            redirect_to fruit
       else
           render :new
       end
    end


    private
    def fruit_params
        params.require(:fruit).permit(:name,:shelf_id)
    end

end

