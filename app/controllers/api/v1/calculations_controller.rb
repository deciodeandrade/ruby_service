module Api
  module V1
    class CalculationsController < ApplicationController
      require 'csv'
      require 'open-uri'
      
      def mean
        file_url = params[:file_name]
        column = params[:column].to_i

        # Ler o arquivo CSV e calcular a média da coluna especificada
        begin
          csv_data = CSV.parse(URI.open(file_url).read, headers: false)
          values = csv_data.map { |row| row[column].to_f }
          mean_value = values.sum / values.size

          render json: { mean: mean_value }, status: :ok
        rescue => e
          puts e.message
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end
    end
  end
end
