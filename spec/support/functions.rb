def add_account amount, day, account, category
    record = Record.create(
      :label => 'test12', 
      :amount => amount, 
      :date => day
    )
    record.category = category
    account.records << record
end
  
def should_not_be_invalid_with_empty(object, field)
  object.send(field+"=", "")
  object.should_not be_valid
end
