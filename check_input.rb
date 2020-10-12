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

  def check_ans(ans, shuffle_ans, quiz_ans)
    ans_num = (ans == "A") ? 0 : (ans == "B" ) ? 1 : 2
    if shuffle_ans[ans_num] == quiz_ans[0]
      puts "正解です。"
      @score += 1
    else
      puts "不正解です。正解は#{quiz_ans[0]}です。"
    end
    @score
  end

  def check_input_choice
    bool = true
    loop do
      choice = gets.chomp
      if choice.upcase == "Y"
        bool = false
        break
      elsif choice.upcase == "N"
        break
      end
      print "Y / N を入力してください。> "
    end
    bool
  end
end