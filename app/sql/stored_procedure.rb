class StoredProcedure
  def self.drop
    sql = drop_statement
    execute(sql)
  end

  def self.define
    sql = definition
    set_config
    execute(sql)
  end

  def self.call hash
    sql = invocation(hash)
    results = connection.execute(sql).entries
    reconnect!
    parse_results(results)
  end

  def self.invocation hash
    throw 'implement :invocation method returning invocation SQL in derived class'
  end

  private

  def self.drop_statement
    throw 'implement :drop_statement method returning drop statement SQL in derived class'
  end

  def self.definition
    throw 'implement :definition method returning definition SQL in derived class'
  end

  def self.parse_results results
    results
  end


  def self.set_config
    execute('SET GLOBAL log_bin_trust_function_creators = 1')
  end

  def self.reconnect!
    connection.reconnect!
  end

  def self.execute sql
    connection.execute(sql)
  end

  def self.connection
    ActiveRecord::Base.connection
  end
end
