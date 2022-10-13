class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[ show edit update destroy ]

  # Add in module
  include SolrBehavior

  # GET /pokemons or /pokemons.json
  def index
    @pokemons = Pokemon.all
  end

  # GET /pokemons/1 or /pokemons/1.json
  def show
  end

  # GET /pokemons/new
  def new
    @data = Pokemon.new
  end

  # GET /pokemons/1/edit
  def edit
  end

  # POST /pokemons or /pokemons.json
  def create
    @data = Pokemon.new(pokemon_params)

    respond_to do |format|
      if @data.save
        format.html { redirect_to pokemon_url(@data), notice: "Pokemon was successfully created." }
        format.json { render :show, status: :created, location: @data }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @data.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemons/1 or /pokemons/1.json
  def update
    respond_to do |format|
      if @data.update(pokemon_params)
        format.html { redirect_to pokemon_url(@data), notice: "Pokemon was successfully updated." }
        format.json { render :show, status: :ok, location: @data }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @data.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemons/1 or /pokemons/1.json
  def destroy
    @data.destroy

    respond_to do |format|
      format.html { redirect_to pokemons_url, notice: "Pokemon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # REFACTOR function to add in the image process
  def image_process
    # Call this method to append the image via Object Oriented
    AppendImage.new(@data).attach_image(params[:image])
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @data = Pokemon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_params
      params.require(:pokemon).permit(:name, :ability, :male_chance, :female_chance, :height, :weight, :image, element_ids: [])
    end
end
