module CreateCharacter
  def create_student
    @student = Character.create(char_type: 'student')
  end

  def create_ian
    @ian = Character.create(char_type: 'Ian')
  end

  def create_j
    @j = Character.create(char_type: 'J')
  end

  def create_tracy
    @tracy = Character.create(char_type: 'Tracy')
  end

  def create_antoin
    @antoin = Character.create(char_type: 'Antoin')
  end

  def create_jj
    @jj = Character.create(char_type: 'JJ')
  end

end
