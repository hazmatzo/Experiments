class Redislikehash
  attr_accessor :historical_data, :current_hash

  def initialize
    @current_hash = {}
    @historical_data = []
  end

  def begin_transaction
    new_transaction = { data: {}, additions: {} }
    @historical_data << new_transaction
  end

  def commit
    if historical_data.length >= 1
      @historical_data.clear
      false
    else
      "NO TRANSACTION"
    end
  end

  def rollback
    if historical_data.length >= 1
      merge_history_with_current_database
      delete_additions_from_database
      historical_data.pop
      false
    else
      "NO TRANSACTION"
    end
  end

  def set(key, value)
    if historical_data.length >= 1
      if !(key_in_history?(key))
        if current_hash.has_key?("#{key}")
          add_to_history(key)
        else
          add_to_additions(key, value)
        end
      end
    end
    current_hash["#{key}"] = value
  end

  def unset(key)
    if current_hash.has_key?("#{key}")
      if historical_data.length >= 1
        if !(key_in_history?(key))
          add_to_history(key)
        end
      end
      current_hash.delete("#{key}")
    end
  end

  def get(key)
    if current_hash.has_key?("#{key}")
      current_hash["#{key}"]
    else
      "NULL"
    end
  end

  def numequalto(value)
    count = 0
    current_hash.each_value do |val|
      if val == value
        count += 1
      end
    end
    count
  end

  private

  def key_in_history?(key)
    historical_data.last[:data].has_key?("#{key}")
  end

  def add_to_history(key)
    historical_value = current_hash["#{key}"]
    historical_data.last[:data]["#{key}"] = historical_value
  end

  def add_to_additions(key, value)
    historical_data.last[:additions]["#{key}"] = value
  end

  def merge_history_with_current_database
    history = historical_data.last[:data]
    current_hash.merge!(history)
  end

  def delete_additions_from_database
    additions = historical_data.last[:additions]
    additions.each_key do |key|
      current_hash.delete(key) if current_hash.has_key?(key)
    end
  end
end

running_program = true
database = Redislikehash.new

while running_program
    begin
      line = $stdin.readline().split(" ")
      statement = line.first

        case statement
        when "SET"
          database.set(line[1], line[2])
        when "GET"
          value = database.get(line[1])
          puts value if value
        when "UNSET"
          database.unset(line[1])
        when "NUMEQUALTO"
          number = database.numequalto(line.last)
          puts number if number
        when "BEGIN"
          database.begin_transaction
        when "ROLLBACK"
          rollback = database.rollback
          puts rollback if rollback
        when "COMMIT"
          commit = database.commit
          puts commit if commit
        when "END"
          running_program = false
        end
    rescue EOFError
        running_program = false
    # ensure
    #     puts "Done"
    end
end
