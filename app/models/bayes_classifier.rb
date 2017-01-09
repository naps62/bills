class BayesClassifier
  def train(term, classifications)
    classifications.each do |classification|
      bayes.train(classification, term)
    end
  end

  delegate :classify, :classify_with_score, :classifications, to: :bayes

  def self.printable_table(weighted_categories)
    rows = []
    rows << %w(Category Score)

    rows.concat(weighted_categories.sort_by(&:last).reverse.to_a)

    Terminal::Table.new rows: rows
  end

  private

  def bayes
    @bayes ||= ClassifierReborn::Bayes.new(
      auto_categorize: true,
    )
  end
end
