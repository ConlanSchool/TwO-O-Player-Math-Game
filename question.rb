class Question
  attr_reader :answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
  end

  def ask_question(player_name)
    puts "#{player_name}: What does #{@num1} plus #{@num2} equal?"
  end

  def check_answer(user_answer)
    @answer == user_answer.to_i
  end
end
