class Api::V1::VacationsController < ApplicationController
    before_action :find_vacation, only: [:show, :update, :destroy]
    def index
        @vacations = Vacation.all
        render json: @vacations
    end
    
    def show
        render json: @vacation
    end

    def create
        @vacation = Vacation.new(vacation_params)
        if @vacation.save
            render json: @vacation
        else
            render error: { error: 'Unable to create Vacation.'}, status: 400
        end
    end

    def update
        if @vacation
            @vacation.update(vacation_params)
            render json: { message: 'Vacation successfully update.'}, status:200
        else
            render json: { error: 'Unable to update Vacation.'}, status:400
        end
    end

    def destroy
        if @vacation
            @vacation.destroy
            render json: { message: 'Vacation successfully deleted.'}, status:200
        else
            render json: { error: 'Unable to delete Vacation. '}, status:400
        end
    end

    private

    def vacation_params
        params.require(:vacation).permit(:vacation, :start, :end, :user_id)
    end
    
    def find_vacation
        @vacation = Vacation.find(params[:id])
    end
end
