class CLIClient::Classifier
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
    Guesser.new(classifier: classifier, movement: movement).call
  end

  def ask(movement)
    Asker.new(classifier: classifier, movement: movement).call
  end

  def classifier
    @classifier ||= BayesClassifier.new
  end
end
