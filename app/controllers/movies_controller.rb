class MoviesController < ApplicationController
  def index
  end

  def new
    # ここでmovieオブジェクトを作ろう！
  end

  def create
    # ここでcomment,video paramsが渡っているか確認しよう。
    # 渡っていなかったら :newを標示してください！

    # ここでmovieオブジェクトを作成、validationをかけよう！
    # 作成できたらmovies#indexへリダイレクトしよう！
  end

  private

  def movie_params
    params.require(:movie).permit(:comment, :video)
  end
end
