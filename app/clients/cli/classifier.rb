class Clients::CLI::Classifier
  def call
    train
    classify
  end

  private

  def train
    Movement.classified.map do |movement|
      classifier.train(movement.description, movement.categories)
    end
  end

  def classify
    Movement.unclassified.shuffle.map do |movement|
      categories = guess(movement) || ask(movement)
      movement.update categories: categories

      if movement.categories.any?
        classifier.train(movement.description, movement.categories)
      end
    end
  end

  def guess(movement)
    Movement::Guesser.new(classifier: classifier).call
  end

  def ask(movement)
    question = <<-TXT.gsub(/^\s+/, "")

      Cannot guess this movement:
      #{movement.details}
      What are the categories for this movement?
    TXT

    categories = HighLine.new.ask(question)
    categories.split(",")
  end

  def classifier
    @classifier ||= BayesClassifier.new
  end
end
