require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(0..100)

get '/' do
  guess = params["guess"].to_i
  message = checker(guess)
  erb :index, :locals => {:background => @background, :guess => guess, :message => message}
end

def checker(guess)
  if guess > (SECRET_NUMBER + 5)
    @background = "red"
    "Way too high!"
  elsif guess < (SECRET_NUMBER - 5)
    @background = "red"
    "Way too low!"
  elsif guess > SECRET_NUMBER
    @background = "pink"
    "Too high!"
  elsif guess < SECRET_NUMBER
    @background = "pink"
    "Too low!"
  else
    @background = "green"
    "You got it right!\nThe secret number is #{SECRET_NUMBER}."
  end
end
