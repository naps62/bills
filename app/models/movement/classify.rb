class Movement::Classify
  def call
    train
    classify
  end

  private

  def train
    Movement.classified.map do
      classifier.train(movement.description, categories)
    end
  end

  def classify(movement)
    Movement.unclassified.map do
      categories = guess(movement) || ask(movement)
      classifier.train(movement.description, categories)
    end
  end

  def ask_categories(movement)
    categories = Highline.new.ask("Categories for #{movement.description} - #{movement.value.format}?")

    movement.update categories: categories
  end

  def classifier
    @classifier ||= Classifier.instance
  end
end
