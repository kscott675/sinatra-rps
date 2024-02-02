require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/rock") do
  play_game("Rock")
end

get("/paper") do
  play_game("Paper")
end

get("/scissors") do
  play_game("Scissors")
end

def play_game(player_choice)
  @player_choice = player_choice
  @computer_choice = %w(Rock Paper Scissors).sample
  @result = determine_winner(@player_choice, @computer_choice)

  erb(:result)
end

def determine_winner(player, computer)
  return "\nWe tied!" if player == computer

  case player
  when "Rock"
    return (computer == "Scissors") ? "We won!" : "We lost!"
  when "Paper"
    return (computer == "Rock") ? "We won!" : "We lost!"
  when "Scissors"
    return (computer == "Paper") ? "We won!" : "We lost!"
  end
end
