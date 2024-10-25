module Api
  class DataAccessController < ApplicationController
    require 'csv'
    require 'open-uri'

    # Método para acessar um valor específico de uma célula
    def cell_value
      file_url = params[:file_name]
      row = params[:row].to_i
      column = params[:column].to_i

      begin
        csv_data = CSV.parse(URI.open(file_url).read, headers: false)
        cell_value = csv_data[row][column]

        render json: { cell_value: cell_value }, status: :ok
      rescue => e
        puts e.message
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end

    # Método para devolver uma lista de valores de uma coluna específica
    def column_values
      file_url = params[:file_name]
      column = params[:column].to_i

      begin
        csv_data = CSV.parse(URI.open(file_url).read, headers: false)
        values = csv_data.map { |row| row[column] }.compact

        render json: { column_values: values }, status: :ok
      rescue => e
        puts e.message
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end

    # Método para devolver uma lista de valores de uma linha específica
    def row_values
      file_url = params[:file_name]
      row = params[:row].to_i

      begin
        csv_data = CSV.parse(URI.open(file_url).read, headers: false)
        values = csv_data[row]

        render json: { row_values: values }, status: :ok
      rescue => e
        puts e.message
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end

    # Método para pesquisar um valor específico em todo o CSV
    def find_value
      file_url = params[:file_name]
      target_value = params[:target_value]
    
      begin
        csv_data = CSV.parse(URI.open(file_url).read, headers: false)
        puts "CSV data: #{csv_data.inspect}"  # Verificar o conteúdo do CSV
        found_cells = []
    
        csv_data.each_with_index do |row, row_index|
          row.each_with_index do |cell, col_index|
            if cell.to_s.strip == target_value.to_s.strip  # Comparação aprimorada
              found_cells << { row: row_index, column: col_index }
            end
          end
        end
    
        render json: { found_cells: found_cells }, status: :ok
      rescue => e
        puts "Erro: #{e.message}"
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end
