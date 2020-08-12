puts "** 勝手に東京2020オリンピック検定 **"

line = "--------------------------------------------------"
explanation = <<-TEXT
|検 定| 難易度 | 受けられる認定                  |
|-----+--------+---------------------------------|
| 1級 | ***    | 東京オリンピック専門家          |
| 2級 | **     | 東京オリンピックリポーター      |
| 3級 | *      | 東京オリンピック応援団員        |
TEXT

puts "#{line}\n#{explanation}#{line}"

quizes = [
  [  # 1級の出題内容(全10問)
    {q:"東京オリンピックの開催競技ではない種目はどれ",
      ans:["ボウリング", "サーフィン", "空手"]},
    {q:"オリンピック聖火リレーの国内スタート地点となる都道府県は",
      ans:["福島県", "沖縄県", "鳥取県"]},
    {q:"今大会で世界初の試みとして注目されている、メダルのある特徴とは？",
      ans:["職人によるハンドメイドのメダル", "選手の名前を刻印できるメダル", "リサイクル率100％のメダル"]},
    {q:"表彰台に使われる素材は",
      ans:["使用済みプラスチック", "特殊加工したダンボール", "新聞紙"]},
    {q:"東京オリンピックの開会式チケットの最高額は",
      ans:["30万円", "20万円", "10万円"]},
    {q:"東京2020聖火リレー公式アンバサダーは誰",
      ans:["石原さとみ", "沢尻エリカ", "芦田愛菜"]},
    {q:"東京オリンピックの公式キャラクターの名前は",
      ans:["ミライトワ", "ソメイティ", "パワフルくん"]},
    {q:"東京オリンピックの最も高額な観戦チケットはいくら",
      ans:["635万円", "975万円", "725万円"]},
    {q:"選手村で使用されるベッドフレームは何でできている",
      ans:["ダンボール", "ステンレス", "木材"]},
    {q:"聖火リレートーチに利用された廃材とは",
      ans:["東日本大震災の仮設住宅のアルミ建築", "小型家電等のリサイクル金属", "タイヤ"]},
  ],
  [  # 2級の出題内容(全5問)
    {q:"東京オリンピックの公式キャラクターのデザイン決定は誰が投票した",
      ans:["小学生", "知事", "組織委員会"]},
    {q:"東京オリンピックの2021年の開催日数は何日",
      ans:[17, 10, 13]},
    {q:"東京オリンピックのマラソンの開催地はどこ",
      ans:["北海道", "長野", "岩手"]},
    {q:"東京オリンピックの競技数は",
      ans:["全33競技339種目", "全52競技602種目", "全46競技412種目"]},
    {q:"東京オリンピック2020の応援ソングは",
      ans:["米津玄師「パプリカ」", "サザン「東京VICTORY」", "ゆず「栄光の架け橋」"]}
  ],
  [  # 3級の出題内容(全5問)
    {q:"2020年の東京オリンピック開催が延期になった起因の病気はどれ",
      ans:["コロナ", "結核", "スペイン風邪"]},
    {q:"東京オリンピックの2021年の開催開始日はいつ",
      ans:["2021年7月23日", "2021年6月23日", "2021年8月23日"]},
    {q:"東京オリンピック2020は日本で何回目のオリンピック",
      ans:[2, 1, 3]},
    {q:"東京オリンピックで一番人気だったチケットは",
      ans:["陸上", "水泳", "サッカー"]},
    {q:"東京オリンピックの開会式はどこ",
      ans:["新国立競技場", "武道館", "東京ドーム"]},
  ]
]

num = 0    #  問題番号
score = 0  #  正答数

def check_input_grade()
  grade = gets.chomp.to_i
  while grade
    if grade == 1 || grade == 2 || grade == 3
      break
    else
      print "1~3のいずれかを入力してください。> "
      grade = gets.chomp.to_i
    end
  end
  return grade
end

print "受験する検定の級を指定してください。（1~3を入力）> "
grade = check_input_grade()

def check_input_ans()
  print " > "
  ans = gets.chomp
  while ans
    if ans == "A" || ans == "B" || ans == "C"
      break
    else
      puts "A,B,Cのいずれかを入力してください。> "
      ans = gets.chomp
    end
  end
  return ans
end

def check_ans(ans, shuffle_ans, quiz_ans, score)
  ans_num = (ans == "A") ? 0 : (ans == "B" ) ? 1 : 2
  if shuffle_ans[ans_num] == quiz_ans[0]
     puts "正解です。"
     score += 1
  else
    puts "不正解です。正解は#{quiz_ans[0]}です。"
  end
  return score
end

puts "#{grade}級の受験を開始します。全#{quizes[grade-1].size}問です。\n#{line}"
quizes[grade-1].shuffle.each do |quiz|
  num += 1
  puts "\nQ#{num}: #{quiz[:q]}?"
  shuffle_ans = quiz[:ans].shuffle.dup
  puts " A: #{shuffle_ans[0]}\n B: #{shuffle_ans[1]}\n C: #{shuffle_ans[2]}"
  ans = check_input_ans()
  score = check_ans(ans, shuffle_ans, quiz[:ans], score)
end

def show_result(score, grade, num)
  result = "不合格"
  score_ratio = score / num.to_f * 100

  case score_ratio
  when score_ratio = 10..40
    comment =  "一緒に応援しましょうね！"
  when score_ratio = 50..60
    comment = "なかなか物知りですね！"
  when score_ratio = 70..100
    result = "合格"
    comment = "素晴らしいです。"
  else #正答数0
    comment = "残念です。今度あなたの興味のあることを聞かせてください。"
  end

  puts "#{grade}級受験結果： #{result}"
  puts "正答数     ： #{score} / #{num}"
  puts "コメント   ：「#{comment}」"

end

puts "\n全問題が終了しました。"
puts line
show_result(score, grade, num)
puts line
