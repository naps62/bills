class Clients::CLI::Classifier::Guesser
  def intialize(classifier:)
    @classifier = classifier
  end


  def call
    puts "\n\nAttempting to guess categories for movement ##{movement.id}"
puts "\n"
    candidates = classifier.classifications(movement.description)

    filtered_candidates = candidates.select do |category, weight|
      weight > -10
    end

    if filtered_candidates.first[0] > filtered_candidates[1][0]

    if filtered_candidates.present?
      puts BayesClassifier.printable_table(filtered_candidates)
    end
  end
end
