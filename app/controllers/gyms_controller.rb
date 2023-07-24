class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        gyms = Gym.all
        render json: gyms, status: :ok

    end 

    def show 
        gym = find_gym
        render json: gym, status: :ok
    end

    def update
        gym = find_gym
        gym.update(gym_params)
        render json: gym, status: 200
    end

    def destroy
        gym = find_gym
        gym.destroy
        head :no_content
    end

    private 

    def find_gym
        gym = Gym.find(params[:id])
    end

    def gym_params
        params.permit(:name, :address)
    end
    def render_not_found_response
        render json: {error: "Gym not found"}, status: 404
    end
end
