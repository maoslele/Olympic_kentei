module CheckInput
  def check_input_grade
    loop do
      grade = gets.chomp.to_i
      if [1, 2, 3].include?(grade)
        return grade
      end
      print "1~3のいずれかを入力してください。> "
    end
  end

  def check_input_ans
    loop do
      print " > "
      ans = gets.chomp
      if ["A", "B", "C"].include?(ans.upcase)
        return ans.upcase
      end
    end
  end

  def check_input_choice
    loop do
      choice = gets.chomp
      print "Y / N を入力してください。> "
      if ["Y", "N"].include?(choice.upcase)
        return choice.upcase
      end
    end
  end
end