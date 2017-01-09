class Clients::CLI::Classifier::Asker
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

    categories = HighLine.new.ask(question)
    categories.split(",")
  end
end
