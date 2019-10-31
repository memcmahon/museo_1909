class Curator
  attr_reader :photographs,
              :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      photo.id == id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    # if I had an artist object, I could call ^ with that artist as an arg and count the number of photos
    # prolific_artists = []
    @artists.find_all do |artist|
      find_photographs_by_artist(artist).length > 1
    end
    # prolific_artists
  end

  def photographs_taken_by_artist_from(country)
    # all artists, from 'country'

    photos_from_country = []
    artists_from(country).each do |artist|
      photos_from_country << find_photographs_by_artist(artist)
    end
    photos_from_country.flatten
    # all photos from those artists
  end

  def artists_from(country)
    @artists.find_all do |artist|
      artist.country == country
    end
  end
end
