class DefineUpdateLearntProcedure < ActiveRecord::Migration
  def up
    Learnt::UpdateLearntProcedure.define
  end

  def down
    Learnt::UpdateLearntProcedure.drop
  end
end
