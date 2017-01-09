class CLIClient::Adapters::CLI
  def puts(str)
    Kernel.puts str
  end

  def ask(question)
  end
end
