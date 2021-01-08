class Users
  def initialize(user_X, user_0)
    @@user_X = user_X
    @@user_0 = user_0
  end

  attr_accessor :user_X, :user_0

  def name_x
    @@user_X
  end

  def name_0
    @@user_0
  end
end

class Table
  @@table = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

  def initialize(number, game)
    @number = number
    @game = game
  end

  def table_print
    for i in 0..2
      @@table[i].each do |x| print "|#{x}|" end
      puts
    end
  end

  def numberisplay
    for i in 0..2
      @@table[i].each do |numberintable|
        if @number == numberintable
          #puts @@table
          #  puts "#{@number} number play"
          #  puts "#{numberintable} number table"
          return "da"
        end
      end
    end
    return "#{@@table.include? (@number)}"
  end

  def table_place_play
    if @game == 1
      if numberisplay == "da"
        if @number == 1
          @@table[0][0] = "X"
        elsif @number == 2
          @@table[0][1] = "X"
        elsif @number == 3
          @@table[0][2] = "X"
        elsif @number == 4
          @@table[1][0] = "X"
        elsif @number == 5
          @@table[1][1] = "X"
        elsif @number == 6
          @@table[1][2] = "X"
        elsif @number == 7
          @@table[2][0] = "X"
        elsif @number == 8
          @@table[2][1] = "X"
        elsif @number == 9
          @@table[2][2] = "X"
        else
          puts "choose number from 1 to 9 or number has not been played "
        end
      else
        puts "no number"
      end
    end
    if @game == 2
      if numberisplay == "da"
        if @number == 1
          @@table[0][0] = "0"
        elsif @number == 2
          @@table[0][1] = "0"
        elsif @number == 3
          @@table[0][2] = "0"
        elsif @number == 4
          @@table[1][0] = "0"
        elsif @number == 5
          @@table[1][1] = "0"
        elsif @number == 6
          @@table[1][2] = "0"
        elsif @number == 7
          @@table[2][0] = "0"
        elsif @number == 8
          @@table[2][1] = "0"
        elsif @number == 9
          @@table[2][2] = "0"
        else
          puts "choose number from 1 to 9"
        end
      else
        puts "no number"
      end
    end
    table_print
  end

  def wingame
    if @@table[0][0] == @@table[0][1] && @@table[0][0] == @@table[0][2]
      return "win"
    elsif @@table[0][0] == @@table[1][0] && @@table[0][0] == @@table[2][0]
      return "win"
    elsif @@table[0][1] == @@table[1][1] && @@table[0][1] == @@table[2][1]
      return "win"
    elsif @@table[0][2] == @@table[1][2] && @@table[0][2] == @@table[2][2]
      return "win"
    elsif @@table[1][0] == @@table[1][1] && @@table[1][0] == @@table[1][2]
      return "win"
    elsif @@table[2][0] == @@table[2][1] && @@table[2][0] == @@table[2][2]
      return "win"
    elsif @@table[0][0] == @@table[1][1] && @@table[0][0] == @@table[2][2]
      return "win"
    elsif @@table[0][2] == @@table[1][1] && @@table[0][2] == @@table[2][0]
      return "win"
    else
      puts ""
    end
  end
end

class GamePlay
  puts "write name of player 1"
  user_X = gets.chomp

  puts "write name of player 2"
  user_0 = gets.chomp

  while user_0 == user_X
    puts "write another name of player 2"
    user_0 = gets.chomp
  end

  game = 1
  player = Users.new(user_X, user_0)

  puts "Welcome to tic tac toe #{player.name_x} you play with X"
  puts "Welcome to tic tac toe #{player.name_0} you play with 0"

  table = Table.new(0, 0)
  table.table_print

  while game > 0
    puts " Please player #{player.name_x} choose you move from 1 to 9"
    game = 1
    playerchose = gets.chomp.to_i
    verificnumber = Table.new(playerchose, game)
    while verificnumber.numberisplay == "false"
      puts " Number is play chose another number"
      playerchose = gets.chomp.to_i
      break
      # verificnumber = Table.new(playerchose,0)
      # verificnumber.numberisplay
    end
    tablechose = Table.new(playerchose, game)
    tablechose.table_place_play
    if tablechose.wingame == "win"
      game = 0
      print "Winner is #{player.name_x}"
      puts ""
      puts "  Game Over"
      break
    end

    puts " Please player #{player.name_0} choose you move from 1 to 9"
    game = 2
    playerchose = gets.chomp.to_i
    verificnumber = Table.new(playerchose, game)
    while verificnumber.numberisplay == "false"
      puts " Number is play chose another number"
      playerchose = gets.chomp.to_i
      break
      # verificnumber = Table.new(playerchose,0)
      # verificnumber.numberisplay
    end
    tablechose = Table.new(playerchose, game)
    tablechose.table_place_play
    if tablechose.wingame == "win"
      game = 0
      print "Winner is #{player.name_0}"
      puts ""
      puts "Game Over"
      break
    end
  end
end
