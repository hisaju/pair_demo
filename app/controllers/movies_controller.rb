class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    comment = movie_params[:comment]
    video   = movie_params[:video]
    @movie = Movie.new(comment: comment, video: video)

    if comment.blank? || video.blank?
      return render(:new)
    else
      @movie.save
      redirect_to movies_path, notice: "秘密のメッセージ「#{comment}」と動画が送られました☆"
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:comment, :video)
  end
end
