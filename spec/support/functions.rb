def add_account amount, day, account, category
    record = Record.create(
      :label => 'test12', 
      :amount => amount, 
      :date => day
    )
    record.category = category
    account.records << record
end
