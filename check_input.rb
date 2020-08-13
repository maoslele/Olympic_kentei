def check_input_grade()
  grade = gets.chomp.to_i
  while grade
    if [1, 2, 3].include?(grade)
      break
    else
      print "1~3のいずれかを入力してください。> "
      grade = gets.chomp.to_i
    end
  end
  return grade
end

def check_input_ans()
  print " > "
  ans = gets.chomp
  while ans
    if ["A", "B", "C"].include?(ans)
      break
    else
      print "A,B,Cのいずれかを入力してください。> "
      ans = gets.chomp
    end
  end
  return ans
end

def check_input_choice
  choice = gets.chomp
  while choice
    if ["Y", "y", "N", "n"].include?(choice)
      break
    else
      print "Y / N を入力してください。> "
      choice = gets.chomp
    end
  end
  return choice
end