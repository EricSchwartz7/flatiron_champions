module CreateCharacter
  def create_student
    @student = Character.create(char_type: 'student')
  end

  def create_ian
    @ian = Character.create(char_type: 'ian', user_id: current_user.id)
  end
  def create_jj
  end
  def create_tracy
  end
  def create_antoin
  end
end
