require_relative 'spec_helper'

describe Player do
  let(:player) { Player.new('Victor Krum', 'Seeker', 'Bulgarian Nationals') }
  let(:player_two) { Player.new('Harry Potter', 'Seeker', 'Griffindor') }
  let(:player_three) { Player.new('Ron Weasley', 'Keeper', 'Griffindor') }

  describe '.new' do
    it 'it takes a name, position, and team name as parameters' do
      expect(player).to be_a(Player)
      expect(player.name).to eq('Victor Krum')
      expect(player.position).to eq('Seeker')
      expect(player.team_name).to eq('Bulgarian Nationals')
    end

  end

  describe 'Self#all' do
    it 'returns an array of player objects equal to the number of player objects' do
      expect(Player.all.length).to eq(36)
      expect(Player.all[0].name).to eq('Bart Simpson')
    end
  end

end
