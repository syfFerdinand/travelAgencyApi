require 'other/GlobalMethod'

class Api::V1::CitiesController < ApplicationController
    
    
    def index
        @Cities =City.all
        render json: @Cities, status:200
    end

    def show
        @City = City.where(id:params[:id])
        render json: @City
    end

    def create
        globalmethod = GlobalMethod.new
        @City = City.new(city_params)
        @City.cityRef = globalmethod.generateStringKey
        if @City.save
            render json: @City, status:201
        else
            render json: {error:'unable to create City'}, status: 400
        end

    end

    def update
      
        begin

            @City =City.find(params[:id])

        rescue => exception

            render json:{error:'Unable to delete City.', exception: exception}, status: 404

        else
            begin
                @City.update(city_params)
            rescue => exception
                render json:{error:'update not done', exception: exception}, status: 400
            else
                render json: {message:'City successfully update.'}, status: 204
            end
            
        end

    end

    def destroy

        begin
            @City =City.find(params[:id])
        rescue => exception
            render json:{error:'Bad Request', exception:exception}, status: 400
        else
            
            @City.destroy
            render json: {message:'City successfully Delete.'}, status: 204
            
        end
    end

    private
        def city_params
            params.require(:city).permit( :cityName, :cityDescriptif, :cityDateCreated,)
        end
end