require 'tvmaze_service'
class ShowsController < ApplicationController
    def index
        service = TVmazeService.new
        @shows = service.search_show(params[:query])
        render json: @shows
      end
    
      def show
        service = TVmazeService.new
        @show = service.get_show_details(params[:id])
        render json: @show
      end
end
