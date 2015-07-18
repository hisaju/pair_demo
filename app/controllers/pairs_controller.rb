class PairsController < ApplicationController
  def index
  end

  def show
  end

  def upload
    return redirect_to pair_path, alert: "入力項目が空ですよ!" if params[:text].blank? || params[:image].blank?

    text_data = #テキストデータ
    image_data = #画像でーた

    result = upload_data(text_data, image_data)

    if result["flag"] == 'success'
      redirect_to pair_path, notice: "秘密のメッセージ「#{text_data}」と画像が送られました☆"
    else
      redirect_to pair_path, alert: "#{result["txt"]} #{result["image"]}"
    end
  end

  private
    def upload_data(text, image)
      path = resize_image(image)
      connection = Faraday::Connection.new(url: 'http://pair.malkdesign.com/' ) do |conn|
        conn.request :multipart
        conn.adapter :net_http
      end

      params = {
        text: text,
        picture: Faraday::UploadIO.new(path, 'image/jpg') 
      }
      res = connection.post '/check.php', params
      return JSON.parse(res.body)
    end

    def resize_image(image)
      img = Magick::Image.from_blob(image.tempfile.read).shift
      img = img.resize_to_fit(1000, 420)
      f = Tempfile.new('tmp')
      img.write(f.path)
      f.path
    end

end
