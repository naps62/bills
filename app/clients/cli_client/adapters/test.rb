class CLIClient::Adapters::Test
  @stdin = ""
  @stdout = ""

  def puts(str)
    self.class.stdout << str
  end

  def ask(question)
    self.class.stdout << question
    self.class.stdout.pop
  end

  class << self
    attr_accessor :stdin, :stdout
  end
end
