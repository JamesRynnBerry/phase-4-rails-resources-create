class BirdsController < ApplicationController

  def create
    #get the data from the body of the request
    bird = Bird.create(name: params[:name], species: params[:species])
    #create a new bird
    render json: bird, status: :created
    #send the newly created bird as a response.
  end
  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

end