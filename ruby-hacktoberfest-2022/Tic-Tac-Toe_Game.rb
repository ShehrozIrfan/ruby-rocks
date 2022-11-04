class Game
  include Display
  attr_reader :first_player, :second_player, :board, :current_player

  def initialize
    @board = Board.new
    @first_player = nil
    @second_player = nil
    @current_player = nil
  end

  def play
    game_set_up
    board.show
    player_turns
    conclusion
  end

  def create_player(number, duplicate_symbol = nil)
    puts display_name_prompt(number)
    name = gets.chomp
    symbol = symbol_input(duplicate_symbol)
    Player.new(name, symbol)
  end

  def turn(player)
    cell = turn_input(player)
    board.update_board(cell - 1, player.symbol)
    board.show
  end

  private

  def game_set_up
    puts display_intro
    @first_player = create_player(1)
    @second_player = create_player(2, first_player.symbol)
  end

  def symbol_input(duplicate)
    player_symbol_prompts(duplicate)
    input = gets.chomp
    return input if input.match?(/^[^0-9]$/) && input != duplicate

    puts display_input_warning
    symbol_input(duplicate)
  end

  def player_symbol_prompts(duplicate)
    puts display_symbol_prompt
    puts display_first_symbol(duplicate) if duplicate
  end

  def player_turns
    @current_player = first_player
    until board.full?
      turn(current_player)
      break if board.game_over?

      @current_player = switch_current_player
    end
  end

  def turn_input(player)
    puts display_player_turn(player.name, player.symbol)
    number = gets.chomp.to_i
    return number if board.valid_move?(number)

    puts display_input_warning
    turn_input(player)
  end

  def switch_current_player
    if current_player == first_player
      second_player
    else
      first_player
    end
  end

  def conclusion
    if board.game_over?
      puts display_winner(current_player.name)
    else
      puts display_tie
    end
  end
end
