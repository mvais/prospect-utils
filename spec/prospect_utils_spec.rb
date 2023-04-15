require 'date'
require_relative '../lib/prospect_utils'

RSpec.describe ProspectUtils do
  # describe '.draft_eligible?' do
  #   context 'player who will be 18 years old before September 15 of draft year' do
  #     it 'returns true' do
  #       dob        = Date.new(Date.today.year - 18)
  #       draft_date = Date.new(Date.today.year, 3, 15)

  #       expect(described_class.draft_eligible?(dob, draft_date)).to be true
  #     end
  #   end

  #   context 'player who will be 18 years old on September 15 of draft year' do
  #     it 'returns true' do
  #       dob        = Date.new(Date.today.year - 18, 9, 15)
  #       draft_date = Date.new(Date.today.year, 9, 15)


  #       expect(described_class.draft_eligible?(dob)).to be true
  #     end
  #   end

  #   context 'player is who 20 years old before December 31st of draft year' do
  #     it 'returns true' do
  #       dob        = Date.new(Date.today.year - 20)
  #       draft_date = Date.new(Date.today.year, 12, 31)

  #       expect(described_class.draft_eligible?(dob)).to be true 
  #     end
  #   end

  #   context 'player who is greater than 20 years old before December 31st of draft year' do
  #     it 'returns false' do
  #       dob        = Date.new(Date.today.year - 21)
  #       draft_date = Date.new(Date.today.year, 12, 31)

  #       expect(described_class.draft_eligible?(dob)).to be true 
  #     end
  #   end
  # end

  describe '.age' do
    context 'a person born 11 months ago' do
      it 'returns 0' do
        date = Date.new(2023, 12, 31)
        dob  = Date.new(2023, 11, 30)

        expect(described_class.age(dob, date)).to eq(0)
      end
    end

    context 'a person born 12 months ago' do
      it 'returns 0' do
        date = Date.new(2023, 12, 31)
        dob  = Date.new(2022, 12, 31)

        expect(described_class.age(dob, date)).to eq(1)
      end
    end

    context 'a person born 15 months ago' do
      it 'returns 1' do
        date = Date.new(2023, 12, 31)
        dob  = Date.new(2022, 9, 30)

        expect(described_class.age(dob, date)).to eq(1)
      end
    end
  end
end
