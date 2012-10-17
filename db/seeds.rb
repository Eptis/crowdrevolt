Admin.create(:username => "admin", :password => "123456", :password_confirmation => "123456") unless Admin.exists?
