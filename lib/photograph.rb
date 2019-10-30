class Photograph
  attr_reader :id,
              :name,
              :artist_id,
              :year

  def initialize(photo_params)
    @id = photo_params[:id]
    @name = photo_params[:name]
    @artist_id = photo_params[:artist_id]
    @year = photo_params[:year]
  end
end
