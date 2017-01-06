class Movement::Classify
  def call
    Movement.map do
      classifier.train(movement)
    classifier.save
  end

  private

  def classify(movement)
    return if movement.classified_at?

    movement.update classified_at: DateTime.now
  end

  def classifier
    @classifier ||= Classifier.instance
  end
end
