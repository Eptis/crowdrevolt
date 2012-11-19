Admin.create(:username => "admin", :password => "123456", :password_confirmation => "123456") unless Admin.exists?
User.create(:username => "front", :email => "dennistel90@gmail.com", :crypted_password => "$2a$10$jLbbWjKdG0UYOGyiXqjv8uVxoZBu5NM/mnWeim6qt9OvKsG5noHEK", :salt => "b7m6AwzLze7co2C79YT9", :activation_state => "active", :active => true) unless User.exists?




Channel.create(:title => "Kanaal 1", :description => "Een proef kanaal.") unless Channel.exists?
Episode.create(:title => "Aflevering 1", :description => "een proef aflevering", :channel_id => 1, :live => false ) unless Episode.exists?



