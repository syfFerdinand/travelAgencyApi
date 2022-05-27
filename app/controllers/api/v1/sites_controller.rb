require 'other/GlobalMethod'

class Api::V1::SitesController < ApplicationController
    def index
        @Sites =Site.where(city_id:params[:city_id]).all
        render json: @Sites, status:200
    end

    def show
        @Site = Site.where(id:params[:id])
        render json: @Site
    end

    def create
        begin
            
            @Site = Site.new(site_params)
            @Site.city_id = params[:city_id]
        rescue => exception

            render json:{error:'Unable to create Site.', exception: exception}, status: 404

        else
            globalmethod = GlobalMethod.new
            @Site.siteRef = globalmethod.generateStringKey
            
            if @Site.save
                render json: @Site, status:201
            else
                render json: {error:'unable to create Site'}, status: 400
            end
        end

    end

    def update
      
        begin

            @Site =Site.find(params[:id])

        rescue => exception

            render json:{error:'Unable to delete Site.', exception: exception}, status: 404

        else
            begin
                @Site.update(site_params)
            rescue => exception
                render json:{error:'update not done', exception: exception}, status: 400
            else
                render json: {message:'Site successfully update.'}, status: 204
            end
            
        end

    end

    def destroy

        begin
            @Site =Site.find(params[:id])
        rescue => exception
            render json:{error:'Bad Request', exception:exception}, status: 400
        else
            @Site.destroy
            render json: {message:'Site successfully Delete.'}, status: 204
           
        end
    end

    private
        def site_params
            params.require(:site).permit( :siteName, :siteDescription, :siteOpeningDate,)
        end
end
