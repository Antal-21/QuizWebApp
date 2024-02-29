
class QuizController < ApplicationController
  @@myText = "123"
  
  def index
    @text = @@myText
  end

  def click

    puts "Clicked! "
    puts params[:query]

    #RestClient.get("https://google.com/", headers={})
    #@response = Faraday.get('https://127.0.0.1:7046/QuizQuestion?param=Nelson')
    #puts @response.status


    @conn = Faraday.new( 
      url: 'https://127.0.0.1:7046/QuizQuestion',
      params: {param: params[:query]}, 
      headers: {'Content-Type' => 'application/json'},
      ssl: {verify: false}
    )

    @response = @conn.get()
    puts @response.status
    puts @response.body

    @@myText = @response.body
    redirect_back_or_to :index
  end
end
