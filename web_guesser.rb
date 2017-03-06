require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(0..100)

get '/' do
  guess = params["guess"].to_i
  message = checker(guess)
  erb :index, :locals => {:guess => guess, :message => message}
end

def checker(guess)
  if guess > (SECRET_NUMBER + 5)
    "Way too high!"
  elsif guess < (SECRET_NUMBER - 5)
    "Way too low!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  else
    "You got it right!\nThe secret number is #{SECRET_NUMBER}."
  end
end
