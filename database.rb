class Database
  def initialize(dbopts)
    @conn = PG.connect(dbopts)
  end

  def exec(sql, args = [])
    @conn.exec_params(sql, args)
  end
end
