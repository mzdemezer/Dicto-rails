require 'spec_helper'

describe WordSet do
  let(:word_set) { create(:word_set) }
  let(:read_user) { word_set.user_word_sets.find { |uws| uws.permissions == 'r' }.user }
  let(:write_user) { word_set.user_word_sets.find { |uws| uws.permissions == 'w' }.user }
  let(:other_user) { build(:user) }

  describe '#permits_read_by?' do
    it { expect(word_set).to respond_to(:permits_read_by?) }

    it 'permits to be read by user with read permissions' do
      expect(word_set.permits_read_by?(read_user)).to eq(true)
    end

    it 'permits to be read by user with write permissions' do
      expect(word_set.permits_read_by?(write_user)).to eq(true)
    end

    it 'does not permit to be read by other users' do
      expect(word_set.permits_read_by?(other_user)).to eq(false)
    end
  end

  describe '#permits_write_by?' do
    it { expect(word_set).to respond_to(:permits_write_by?) }

    it 'does not permit to be written by user with read permissions' do
      expect(word_set.permits_write_by?(read_user)).to eq(false)
    end

    it 'permits to be written by user with write permissions' do
      expect(word_set.permits_write_by?(write_user)).to eq(true)
    end

    it 'does not permit to be read by other users' do
      expect(word_set.permits_write_by?(other_user)).to eq(false)
    end
  end
end
