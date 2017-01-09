class CLIClient::Classifier::Asker
  def initialize(movement:)
    @movement = movement
  end

  attr_reader :movement

  def call
    question = <<-TXT.gsub(/^\s+/, "")

      Cannot guess this movement:
      #{movement.details}
      What are the categories for this movement?
    TXT

    categories = terminal.ask(question)
    categories.split(",")
  end

  def terminal
    @terminal ||= Config.adapter.new
  end
end
