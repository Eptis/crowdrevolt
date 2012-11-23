Admin.create(:username => "admin", :password => "123456", :password_confirmation => "123456") unless Admin.exists?
User.create(:username => "front", :email => "dennistel90@gmail.com", :crypted_password => "$2a$10$jLbbWjKdG0UYOGyiXqjv8uVxoZBu5NM/mnWeim6qt9OvKsG5noHEK", :salt => "b7m6AwzLze7co2C79YT9", :activation_state => "active", :active => true) unless User.exists?




Channel.create(:title => "Kanaal 1", :description => "Een proef kanaal.") unless Channel.exists?
Episode.create(:title => "Aflevering 1", :description => "een proef aflevering", :channel_id => 1, :live => false ) unless Episode.exists?



Post.create(:title => "Missed it live? No problem. Join Open Journalism about #SudanRevolts", :description => "There is a big crisis and revolt going on in Sudan at the moment. The issue is complex and the news is scarce and feels distant. In this Open Journalism experiment I need you to help me build the story and make sense of the videos, links, tweets and more that’s going to come in. In the LIVE and INTERACTIVE studio sessions I’m asking the crowd to join me and work together on the story. The topic we’re tackling: #Sudanrevolts & the bombattacks by the Sudanese government in Southern Kordofan/Blue Nile/Nuba in Sudan. https://twitter.com/#!/search/%23sudanrevolts If you feel connected to the story, are a Sudanese activist, blogger or eyewitness, if you know Sudanese in the diaspora that can make sense of the news, please join in and leave a message in the comments.", :channel_id => 1) unless Post.exists?
Blogitem.create(:item_type => "tekst", :body => "Starting Point of this Open Journalism Experiment is this newspaper article which appeared in Dutch Newspaper NRC. Its my aim to rewrite this article by giving it digital content that is made by the crowd and me. I want this article not to be an end product, but the beginning of a full & interactive coverage of a story which is evolving as we speak. The reader can add to the story so the story is continuous." ) unless Blogitem.exists?
