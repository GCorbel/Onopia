def add_account amount, day, account, category
  record = Record.create(
    :label => 'test12', 
    :amount => amount, 
    :date => day
  )
  record.category = category
  account.records << record
end
   
def login_user(user)
  activate_authlogic   
  user_session = UserSession.new(user)
  user_session.save
  UserSession.stubs(:find).returns(user_session)
  user
end

#Use this method if you want to test UserSession.
#This method is slower than login_user
def login_user_with_interface(username, password)
  activate_authlogic  
  visit login_path
  click_link "Connexion | Inscription"
  fill_in 'user_session_username', :with => username
  fill_in 'user_session_password', :with => password
  click_button "Connexion"
  wait_for_ajax 
end

def wait_for_ajax      
  keep_looping = true
  while keep_looping do
    sleep 1
    count = page.evaluate_script('window.running_ajax_calls').to_i
    keep_looping = false if count == 0
  end
end

def wait_for(id)
  keep_looping = true
  while keep_looping do
    sleep 1
    keep_looping = false if page.has_css?(id)
  end
end

def confirm_popup
  page.execute_script 'window.confirm = function () { return true }'
end
