require './check_input'
require './quiz_action'

grade_selected = false

loop do
  if !grade_selected
    quiz = Quiz.new
    quiz.show_grade
    quiz.select_grade
    quiz.set_quiz
  end

  quiz.answer_quiz
  quiz.show_result
  choice = quiz.choose_answer_again

  if choice.upcase == "N"
    quiz.end_msg
    break
  end

  if quiz.result == "合格"
    #受験級選択フラグをリセット (不合格→合格で再受験する場合のため)
    grade_selected = false
  elsif quiz.result == "不合格"
    grade_selected = true
  end
end