class Learnt::UpdateLearntProcedure < StoredProcedure
  private

  def self.drop_statement
    'DROP PROCEDURE updateLearnt;'
  end

  def self.definition
    <<-SQL
     CREATE PROCEDURE updateLearnt(in_user_id INT, in_word_id INT, dvalue INT)
    BEGIN
      START TRANSACTION;

      INSERT IGNORE
      INTO learnts(user_id, word_id, created_at, updated_at)
      VALUES(in_user_id, in_word_id, NOW(), NOW());

      UPDATE learnts
      SET value = value + dvalue
      WHERE user_id = in_user_id
      AND   word_id = in_word_id;

      SELECT *
      FROM learnts
      WHERE user_id = in_user_id
      AND   word_id = in_word_id
      LIMIT 1;

      COMMIT;
    END;
    SQL
  end

  def self.invocation hash
    "CALL updateLearnt(#{hash[:user_id]}, #{hash[:word_id]}, #{hash[:dvalue]});"
  end

  def self.parse_results results
    coder = { 'attributes' => Hash[Learnt.column_names.zip(results.flatten)] }
    Learnt.allocate.init_with(coder)
  end
end
