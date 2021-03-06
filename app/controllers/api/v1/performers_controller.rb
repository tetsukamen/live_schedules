module Api
  module V1
    class PerformersController < Api::V1::BaseController
      def index
        performers = if params[:all].to_i == 1
                       Performer.all
                     else
                       Performer.regulars
                     end
        performers = performers.where(instrument_id: params[:instrument_id]) if params[:instrument_id]
        render json: performers
      end

      def show
        performer = Performer.find(params[:id])
        render json: performer
      end
    end
  end
end
