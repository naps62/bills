class Transaction
  def self.from_cgd_row(row)
    new.tap do |instance|
      instance.date = row["Data mov. "]
      instance.description = row["Descricao "]
      instance.debit = row["Debito "]
      instance.credit = row["Credito "]
      instance.balance = row["Saldo disponivel "]
    end
  end

  attr_accessor :date, :description, :debit, :credit, :balance
end
