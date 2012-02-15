#module CustomMatchers
#  class ShowErrorMessage
#    def matches?(actual)
#      @actual = actual
#      @actual == @expected+1
#    end

#    def failure_message
#      "expected to view #{@actual.inspect} in #{@expected.inspect}"
#    end

#    def negative_failure_message
#      "expected to not view #{@actual.inspect} in #{@expected.inspect}"
#    end
#  end
#  

#  def show_error_message(expected)
#    ShowErrorMessage.new(expected)
#  end
#do
