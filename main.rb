puts "** 勝手に東京2020オリンピック検定 **"

line = "--------------------------------------------------"
explanation = <<-TEXT
|検 定| 難易度 | 受けられる認定                  |
|-----| ------ |---------------------------------|
| 1級 | ***    | 東京オリンピック専門家          |
| 2級 | **     | 東京オリンピックリポーター      |
| 3級 | *      | 東京オリンピック応援団員        |
TEXT

puts "#{line}\n#{explanation}#{line}"

quizes = [
  [  # 1級の出題内容(全10問)
    {q:"東京オリンピックの開催競技ではない種目はどれ",
      ans:{a: "ボウリング", b: "サーフィン", c: "空手"}},
    {q:"オリンピック聖火リレーの国内スタート地点となる都道府県は",
      ans:{a: "福島県", b:"沖縄県", c:"鳥取県"}},
    {q:"今大会で世界初の試みとして注目されている、メダルのある特徴とは？",
      ans:{a: "職人によるハンドメイドのメダル", b:"選手の名前を刻印できるメダル", c:"リサイクル率100％のメダル"}},
    {q:"表彰台に使われる素材は",
      ans:{a: "使用済みプラスチック", b:"特殊加工したダンボール", c:"新聞紙"}},
    {q:"東京オリンピックの開会式チケットの最高額は",
      ans:{a: "30万円", b:"20万円", c: "10万円"}},
    {q:"東京2020聖火リレー公式アンバサダーは誰",
      ans:{a: "石原さとみ", b: "沢尻エリカ", c: "芦田愛菜"}},
    {q:"東京オリンピックの公式キャラクターの名前は",
      ans:{a: "ミライトワ", b:"ソメイティ", c:"パワフルくん"}},
    {q:"東京オリンピックの最も高額な観戦チケットはいくら",
      ans:{a: "635万円", b:"975万円", c:"725万円"}},
    {q:"選手村で使用されるベッドフレームは何でできている",
      ans:{a: "ダンボール", b:"ステンレス", c:"木材"}},
    {q:"聖火リレートーチに利用された廃材とは",
      ans:{a: "東日本大震災の仮設住宅のアルミ建築", b:"小型家電等のリサイクル金属", c:"タイヤ"}},
  ],
  [  # 2級の出題内容(全5問)
    {q:"東京オリンピックの公式キャラクターのデザイン決定は誰が投票した",
      ans:{a: "小学生", b:"知事", c:"組織委員会"}},
    {q:"東京オリンピックの2021年の開催日数は何日",
      ans:{a: 17, b:10, c:13}},
    {q:"東京オリンピックのマラソンの開催地はどこ",
      ans:{a: "北海道", b:"長野", c:"岩手"}},
    {q:"東京オリンピックの競技数は",
      ans:{a: "全33競技339種目", b: "全52競技602種目", c: "全46競技412種目"}},
    {q:"東京オリンピック2020の応援ソングは",
      ans:{a: "米津玄師「パプリカ」", b:"サザン「東京VICTORY」", c:"ゆず「栄光の架け橋」"}}
  ],
  [  # 3級の出題内容(全5問)
    {q:"2020年の東京オリンピック開催が延期になった起因の病気はどれ",
      ans:{a:"コロナ", b: "結核", c: "スペイン風邪"}},
    {q:"東京オリンピックの2021年の開催開始日はいつ",
      ans:{a: "2021年7月23日", b: "2021年6月23日", c: "2021年8月23日"}},
    {q:"東京オリンピック2020は日本で何回目のオリンピック",
      ans:{a: 2, b:1, c:3}},
    {q:"東京オリンピックで一番人気だったチケットは",
      ans:{a: "陸上", b:"水泳", c:"サッカー"}},
    {q:"東京オリンピックの開会式はどこ",
      ans:{a: "新国立競技場", b:"武道館", c:"東京ドーム"}},
  ]
]

num = 0
score = 0

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

def check_ans(ans, score)
  if ans == "A"
    puts "正解です。"
    score += 1
  else ans == "B" || ans == "C"
    puts "不正解です。正解はAです。"
  end
  return score
end

puts "#{grade}級の受験を開始します。全#{quizes[grade-1].size}問です。\n#{line}"
quizes[grade-1].shuffle.each do |quiz|
  num += 1
  puts "Q#{num}: #{quiz[:q]}?"
  puts " A: #{quiz[:ans][:a]}\n B: #{quiz[:ans][:b]}\n C: #{quiz[:ans][:c]}"

  ans = check_input_ans()
  score = check_ans(ans,score)
  puts ""
end

def score_comment(score, grade, num)
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

puts "全問題が終了しました。"
puts line
score_comment(score, grade, num)
puts line
