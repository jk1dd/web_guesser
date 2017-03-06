require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(0..100)

get '/' do
  guess = params["guess"].to_i
  message = checker(guess)
  cheat = params["cheat"]
  erb :index, :locals => {:cheat => cheat_mode(cheat), :background => @background, :guess => guess, :message => message}
end

def cheat_mode(cheat)
  if cheat == "true"
    "The number is #{SECRET_NUMBER}, but you cheated!"
  end
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
