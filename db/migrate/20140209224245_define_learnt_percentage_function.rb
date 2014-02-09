class DefineLearntPercentageFunction < ActiveRecord::Migration
  def up
    WordSet::LearntPercentage.define
  end

  def down
    WordSet::LearntPercentage.drop
  end
end
