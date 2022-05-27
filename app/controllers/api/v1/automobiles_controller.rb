require 'other/GlobalMethod.rb'

class Api::V1::AutomobilesController < ApplicationController
    
    def index
        @automobiles =Automobile.all
        render json: @automobiles, status:200
    end

    def show
        @automobile = Automobile.where(id:params[:id])
        render json: @automobile
    end

    def create
        globalmethod = GlobalMethod.new
        @automobile = Automobile.new(automobile_params)
        @automobile.autoRef = globalmethod.generateStringKey
        @automobile.autoAvailable = 0
        if @automobile.save
            render json: @automobile, status:201
        else
            render json: {error:'unable to create Automobile'}, status: 400
        end

    end

    def update
      
        begin

            @automobile =Automobile.find(params[:id])

        rescue => exception

            render json:{error:'Unable to delete Automobile.', exception: exception}, status: 404

        else
            begin
                @automobile.update(automobile_params)
            rescue => exception
                render json:{error:'update not done', exception: exception}, status: 400
            else
                render json: {message:'Automobile successfully update.'}, status: 204
            end
            
        end

    end

    def destroy

        begin
            @automobile =Automobile.find(params[:id])
        rescue => exception
            render json:{error:'Bad Request', exception:exception}, status: 400
        else

            @automobile.destroy
            render json: {message:'Automobile successfully Delete.'}, status: 204
            
        end
    end

    private
        def automobile_params
            params.require(:automobile).permit( :autoBrand, :autoModel, :autoDescription,)
        end
end
