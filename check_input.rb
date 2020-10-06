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
      if choice.upcase == "Y"
        return false
      elsif choice.upcase == "N"
        return true
      end
      print "Y / N を入力してください。> "
    end
  end
end