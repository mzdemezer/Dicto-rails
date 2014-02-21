class Learnt::UpdateLearntProcedure < StoredProcedure
  def self.invocation hash
    "SELECT * FROM update_learnt(#{hash[:user_id]}, #{hash[:word_id]}, #{hash[:dvalue]})"
  end

  private

  def self.drop_statement
    'DROP FUNCTION update_learnt(INT, INT, INT);'
  end

  def self.definition
    <<-SQL
    CREATE FUNCTION update_learnt(in_user_id INT, in_word_id INT, dvalue INT)
    RETURNS TABLE(id INT, user_id INT, word_id INT, value INT, created_at TIMESTAMP, updated_at TIMESTAMP) AS $$
    BEGIN
      BEGIN
        INSERT INTO learnts(user_id, word_id, created_at, updated_at)
        VALUES(in_user_id, in_word_id, NOW(), NOW());
      EXCEPTION WHEN unique_violation THEN
      END;

      UPDATE learnts
      SET value = learnts.value + dvalue
      WHERE learnts.user_id = in_user_id
      AND   learnts.word_id = in_word_id;

      RETURN QUERY SELECT *
      FROM learnts
      WHERE learnts.user_id = in_user_id
      AND   learnts.word_id = in_word_id
      LIMIT 1;
    END;
    $$ LANGUAGE plpgsql;
    SQL
  end

  def self.parse_results results
    coder = { 'attributes' => results.first }
    Learnt.allocate.init_with(coder)
  end
end
