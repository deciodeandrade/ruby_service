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

      def median
        file_url = params[:file_name]
        column = params[:column].to_i
      
        begin
          csv_data = CSV.parse(URI.open(file_url).read, headers: false)
          values = csv_data.map { |row| row[column].to_f }.sort
          mid = values.size / 2
          median_value = values.size.odd? ? values[mid] : (values[mid - 1] + values[mid]) / 2.0
      
          render json: { median: median_value }, status: :ok
        rescue => e
          puts e.message
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end

      def sum
        file_url = params[:file_name]
        column = params[:column].to_i
      
        begin
          csv_data = CSV.parse(URI.open(file_url).read, headers: false)
          values = csv_data.map { |row| row[column].to_f }
          sum_value = values.sum
      
          render json: { sum: sum_value }, status: :ok
        rescue => e
          puts e.message
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end

      def minimum
        file_url = params[:file_name]
        column = params[:column].to_i
      
        begin
          csv_data = CSV.parse(URI.open(file_url).read, headers: false)
          values = csv_data.map { |row| row[column].to_f }
          min_value = values.min
      
          render json: { minimum: min_value }, status: :ok
        rescue => e
          puts e.message
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end
      
      def maximum
        file_url = params[:file_name]
        column = params[:column].to_i
      
        begin
          csv_data = CSV.parse(URI.open(file_url).read, headers: false)
          values = csv_data.map { |row| row[column].to_f }
          max_value = values.max
      
          render json: { maximum: max_value }, status: :ok
        rescue => e
          puts e.message
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end

      def standard_deviation
        file_url = params[:file_name]
        column = params[:column].to_i
      
        begin
          csv_data = CSV.parse(URI.open(file_url).read, headers: false)
          values = csv_data.map { |row| row[column].to_f }
          mean_value = values.sum / values.size
          variance = values.map { |v| (v - mean_value) ** 2 }.sum / values.size
          std_dev = Math.sqrt(variance)
      
          render json: { standard_deviation: std_dev }, status: :ok
        rescue => e
          puts e.message
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end

      def count
        file_url = params[:file_name]
        column = params[:column].to_i
      
        begin
          csv_data = CSV.parse(URI.open(file_url).read, headers: false)
          count_value = csv_data.map { |row| row[column] }.compact.size
      
          render json: { count: count_value }, status: :ok
        rescue => e
          puts e.message
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end

      def variance
        file_url = params[:file_name]
        column = params[:column].to_i
      
        begin
          csv_data = CSV.parse(URI.open(file_url).read, headers: false)
          values = csv_data.map { |row| row[column].to_f }
          mean_value = values.sum / values.size
          variance_value = values.map { |v| (v - mean_value) ** 2 }.sum / values.size
      
          render json: { variance: variance_value }, status: :ok
        rescue => e
          puts e.message
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end      
    end
  end
end
