# プレイヤー(自分)に「0~2」を入力させるロジックを書きます。
class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets.chomp
    #.chompを使うと"1\n"にならず綺麗な"1"になる
    while true
      # if 「input_hand」が「0, 1, 2」のいずれかの場合だった場合
      if input_hand == "0" || input_hand == "1" || input_hand == "2"
        return input_hand
        break
        #戻り値を返して繰り返し処理を終了
    else
      puts "0~2の数字を入力してください。"
      puts "0:グー, 1:チョキ, 2:パー"
      input_hand = gets.chomp
        # プレイヤーに「0〜2」を入力させる文章を表示させる。
        # puts "0〜2の数字を入力してください。"
        # puts "0:グー, 1:チョキ, 2:パー"
        # 変数「input_hand」にプレイヤーの入力値を代入します。
      # end if文のend
      end
    end
  end
end

# 相手が「0~2」の値をランダムに生成するロジックを書きます。
class Enemy
  def hand
    enemy_hand = rand(3)
    #配列3つと同じで0,1,2の数字からランダム
  end
end
class Janken
  def pon(player_hand, enemy_hand)
    #ここの引数は名前は実際なんでもいいので惑わされない。
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"
    # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジックを作成します。
    player_hand = player_hand.to_i
    #文字列をここで整数に変換
    if player_hand == enemy_hand
      # Playerクラスの戻り値(player_hand)とEnemyクラスの戻り値(enemy_hand)の値が同じだった場合
      # 「あいこ」を出力します。
      puts "あいこ"
      true
      #「true」を返してじゃんけんを繰り返し実行させます。
      # ヒント：「return」を使って戻り値を返すことができます。しかし、Rubyでは戻り値を返す場合、「return」を省略するのが一般的です。
    elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
      puts "あなたの勝ちです。"
      false
      # もしも下記の組み合わせだった場合
      # (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
      #「あなたの勝ちです」を出力します。
      #「false」を返してじゃんけんを終了させます。
    else
      puts "あなたの負けです。"
      false
      #「あなたの負けです」を出力します。
      #「false」を返してじゃんけんを終了させます。
    end
  end
end


# じゃんけんゲームを実行するロジックを書きます。
class GameStart
  # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
  def self.jankenpon
    # 変数「player」にPlayerをインスタンス化したものを代入します。
    player = Player.new
    # 変数「enemy」にEnemyをインスタンス化したものを代入します。
    enemy = Enemy.new
    # 変数「janken」にJankenをインスタンス化したものを代入します。
    janken = Janken.new
    # 変数「next_game」に「true」を代入しましょう。
    # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
    while true
      next_game = janken
      # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
      next_game = janken.pon(player.hand, enemy.hand)
      #playerクラスのhandメソッドを引数に入れる
    end
  end
end
# クラス名を使ってjankenponメソッドを呼び出します。
GameStart.jankenpon
