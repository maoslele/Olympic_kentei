module CheckInput
  def check_input_grade
    grade = gets.chomp.to_i
    unless [1, 2, 3].include?(grade)
      print "1~3のいずれかを入力してください。> "
      check_input_grade
    end
    grade
  end

  def check_input_ans
    print " > "
    ans = gets.chomp
    unless ["A", "B", "C"].include?(ans.upcase)
      print "A,B,Cのいずれかを入力してください。"
      check_input_ans
    end
    ans
  end

  def check_input_choice
    choice = gets.chomp
    unless ["Y", "N"].include?(choice.upcase)
      print "Y / N を入力してください。> "
      check_input_choice
    end
    choice
  end
end