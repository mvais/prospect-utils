require 'date'
require_relative '../lib/prospect_utils'

RSpec.describe ProspectUtils do
  describe '.draft_eligible?' do
    context 'players who will be 18 years old before September 15 of draft year' do
      it 'returns true' do
        date = Date.new(Date.today.year - 18)

        expect(described_class.draft_eligible?(date)).to be true
      end
    end

    context 'player who will be 18 years old on September 15 of draft year' do
      it 'returns true' do
        date = Date.new(Date.today.year - 18, 9, 15)

        expect(described_class.draft_eligible?(date)).to be true
      end
    end

    context 'player is who 20 years old before December 31st of draft year' do
      it 'returns true' do
        date = Date.new(Date.today.year - 20)

        expect(described_class.draft_eligible?(date)).to be true 
      end
    end

    context 'player who is greater than 20 years old before December 31st of draft year' do
      it 'returns false' do
        date = Date.new(Date.today.year - 21)

        expect(described_class.draft_eligible?(date)).to be true 
      end
    end
  end
end
