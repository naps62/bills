class Movement::Classify
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
    Movement.unclassified.map do |movement|
      categories = guess(movement) || ask(movement)
      movement.update categories: categories

      if movement.categories.any?
        classifier.train(movement.description, movement.categories)
      end
    end
  end

  def guess(movement)
    nil
  end

  def ask(movement)
    question = <<~TXT
      #{movement.details}
      What are the categories for this movement?
    TXT

    categories = HighLine.new.ask(question)
  end

  def classifier
    @classifier ||= Classifier.new
  end
end
