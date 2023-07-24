class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        clients = Client.all
        render json: clients, status: :ok
    end 

    def show 
        client = find_client
        render json: client, status: :ok
    end

    def update
        client = find_client
        client.update(client_params)
        render json: client, status: 200
    end

    private 

    def find_client
        client = Client.find(params[:id])
    end

    def client_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: {error: "Client not found"}, status: 404
    end
end
