require_relative 'spec_helper'

describe Team do
  let(:team) { Team.new('Simpson Slammers') }

  describe '.new' do
    it 'takes a team name as a parameter' do
      expect(team).to be_a(Team)
      expect(team.name).to eq('Simpson Slammers')
    end
  end

  describe 'self#all' do
    it 'returns an array of team objects that corresponds to every player of that team' do
      expect(Team.all.length).to eq(4)
      expect(Team.all[0].name).to eq('Simpson Slammers')
    end
  end

  describe '#players' do
    it 'returns all players on current team' do
      expect(team.players.length).to eq(9)
      team.players.each { |player| expect(player.team_name).to eq(team.name) }
    end
  end


end
