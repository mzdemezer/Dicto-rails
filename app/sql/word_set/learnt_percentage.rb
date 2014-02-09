class WordSet::LearntPercentage < StoredProcedure
  def self.invocation hash
    "learnt_percentage(#{hash[:user_id]}, #{hash[:word_set_id]}) learnt_percentage"
  end

  private

  def self.drop_statement
    'DROP FUNCTION learnt_percentage;'
  end

  def self.definition
    <<-SQL
    CREATE FUNCTION learnt_percentage(u_id INT, ws_id INT) RETURNS DECIMAL(5, 2)
    BEGIN
      DECLARE result DECIMAL(5, 2) DEFAULT 0;
      DECLARE l_t INT DEFAULT 1;

      SELECT learnt_threshold
      INTO l_t
      FROM users
      WHERE id = u_id
      LIMIT 1;

      SELECT COUNT(CASE WHEN l.value >= l_t THEN 1 ELSE NULL END) * 100 / COUNT(*)
      INTO result
      FROM words w
        LEFT JOIN learnts l ON l.word_id = w.id AND l.user_id = u_id
      WHERE word_set_id = ws_id;

      RETURN result;
    END;
    SQL
  end
end
