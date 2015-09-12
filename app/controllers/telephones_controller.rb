class TelephonesController < ApplicationController
  protect_from_forgery except: :record
  
  def index
    @recordings = Recording.all.order("created_at desc")
  end

  def call
    account_sid = 'AC838b5e603b5fa4c55385e6115d3117a6'
    auth_token = '60d5ca020c7f3d7096b7b49bdb06ee85'
    
    tel = params[:tel]
    tel.gsub!(/^0/, '+81')

    client = Twilio::REST::Client.new account_sid, auth_token
    client.calls.create(
      from: '+815031597307',
      to: tel,
      url: record_url
    ) 
    redirect_to telephones_path
    
  end

  def record
    response = ""
    if params['RecordingUrl'].present?
      response = Twilio::TwiML::Response.new do |r|
        Recording.create!(url: params['RecordingUrl'])
        r.Say 'メッセージを再生して保存します', voice: 'alice', language: 'ja-jp'
        r.Play params['RecordingUrl']
      end
    else
      response = Twilio::TwiML::Response.new do |r|
        r.Say '録音を開始します。終わりましたらシャープを押してください', voice: 'alice', language: 'ja-jp'
        r.Record maxLength: '30', action: record_url, method: 'post', finishOnKey: '#'
      end
    end
    render text: response.text
  end

end
