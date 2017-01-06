class Classifier
  def train(term, classifications)
    classifications.each do |classification|
      bayes.train(classification, term)
    end
  end

  def classify(term)
    bayes.classify_with_score(term)
  end

  private

  def bayes
    @bayes ||= ClassifierReborn::Bayes.new(
      auto_categorize: true,
    )
  end
end
