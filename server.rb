require 'sinatra'
require 'json'
require 'pry'
require_relative 'models/player'
require_relative 'models/team'

# set :public_folder, File.join(File.dirname(__FILE__), "public")
team_data = JSON.parse(File.read('roster.json'))

get "/" do
  erb :index
end

get "/teams" do
  team_titles = Team.all.map { |team| team.name }
  erb :teams_index, locals: { team_titles: team_titles }
end

get "/teams/:team_name" do
  team = Team.new(params[:team_name])
  player_names = team.players.map do |player|
    { name: player.name, position: player.position }
  end
  erb :teams_show,
      locals: { team_name: team.name , team_players: player_names }
end

get "/positions" do
  positions = Player.all.map { |player| player.position }.uniq
  erb :positions_index, locals: { positions: positions }
end

get "/positions/:position_name" do
  players = Player
    .all.select { |player| player.position == params[:position_name] }
  teams_and_players = players.map do |player|
    { name: player.name, team: player.team_name }
  end
  erb :positions_show, locals: { position_name: params[:position_name],
                                 teams_and_players: teams_and_players }
end
