class Game
  attr_reader :players, :current_player

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = players.first
  end

  def start_game
    until game_over?
      question = Question.new
      question.ask_question(@current_player.name)
      answer = gets.chomp

      unless question.check_answer(answer)
        @current_player.lose_life
        puts "Wrong!"
      else
        puts "Correct!"
      end
      
      show_score
      switch_turns unless game_over?
    end
    announce_winner
  end

  private

  def switch_turns
    @current_player = @players.reject { |player| player == @current_player }.first
  end

  def show_score
    scores = @players.map { |player| "#{player.name}(#{player.lives}/3)" }.join(" vs ")
    puts "Score: #{scores}"
    puts "- New Round -" unless game_over?
  end

  def game_over?
    !@current_player.alive?
  end

  def announce_winner
    winner = @players.reject { |player| player == @current_player }.first
    puts "#{winner.name} wins with a score of #{winner.lives}/3!"
    puts "--- GAME OVER ---"
  end
end
