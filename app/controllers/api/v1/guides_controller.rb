require 'other/GlobalMethod'

class Api::V1::GuidesController < ApplicationController
    def index
        @guides =Guide.all
        render json: @guides, status:200
    end

    def show
        @guide = Guide.where(id:params[:id])
        render json: @guide
    end

    def create
        globalmethod = GlobalMethod.new
        @guide = Guide.new(guide_params)
        @guide.RefGuide = globalmethod.generateStringKey
        @guide.guideAvailable = 0
        if @guide.save
            render json: @guide, status:201
        else
            render json: {error:'unable to create Guide'}, status: 400
        end

    end

    def update
      
        begin

            @guide =Guide.find(params[:id])

        rescue => exception

            render json:{error:'Unable to delete Guide.', exception: exception}, status: 404

        else
            begin
                @guide.update(guide_params)
            rescue => exception
                render json:{error:'update not done', exception: exception}, status: 400
            else
                render json: {message:'Guide successfully update.'}, status: 204
            end
            
        end

    end

    def destroy

        begin
            @guide =Guide.find(params[:id])
        rescue => exception
            render json:{error:'Bad Request', exception:exception}, status: 400
        else
            
            @guide.destroy
            render json: {message:'Guide successfully Delete.'}, status: 204
            
        end
    end

    private
        def guide_params
            params.require(:guide).permit(:LastName, :FirstName, :Age, :sex)
        end
end
