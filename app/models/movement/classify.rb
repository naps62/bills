class Movement::Classify
  def call
    Movement.map do
      classifier.train(movement)
    classifier.save
  end

  private

  def classify(movement)
    categories = if movement.categories.present?
                   movement.categories
                 else
                   ask_categories(movement)
                 end

    classifier.train(movement.description, categories)
  end

  def ask_categories(movement)
    categories = Highline.new.ask("Categories for #{movement.description} - #{movement.value.format}?")

    movement.update categories: categories
  end

  def classifier
    @classifier ||= Classifier.instance
  end
end
