module WebGuesser2
  class GuessEngine
    def check(guess)
      if guess.to_i > @secret
        :too_high
      else
        :too_low
      end
    end

    def set_secret(input_secret)
      if input_secret
        @secret = input_secret.to_i
      else
        @secret = rand(100)
      end
    end
  end
end
