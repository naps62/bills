class Classifier
  def train_with_movement(movement)
    categories = if movement.categories.present?
                   movement.categories
                 else
                   ask_categories(movement)
                 end

    train(movement.description, categories)
  end

  def classify(movement)
    bayes.classify_with_score(movement.description)
  end

  private

  def bayes
    @bayes ||= ClassifierReborn::Bayes.new(
      auto_categorize: true,
    )
  end

  def ask_categories(movement)
    %w(a b c)
  end

  def train(term, classifications)
    classifications.each do |classification|
      bayes.train(classification, term)
    end
  end
end
