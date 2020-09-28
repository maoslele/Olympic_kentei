require './quiz_action'

grade_selected = false

while true do
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

  grade_selected = quiz.result == "合格" ?  false : true
end