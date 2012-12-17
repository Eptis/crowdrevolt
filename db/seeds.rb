Admin.create(:username => "admin", :password => "123456", :password_confirmation => "123456") unless Admin.exists?
User.create(:username => "front", :email => "dennistel90@gmail.com", :crypted_password => "$2a$10$jLbbWjKdG0UYOGyiXqjv8uVxoZBu5NM/mnWeim6qt9OvKsG5noHEK", :salt => "b7m6AwzLze7co2C79YT9", :activation_state => "active", :active => true) unless User.exists?




Channel.create(:title => "Kanaal 1", :description => "Een proef kanaal.") unless Channel.exists?
Episode.create(:title => "Aflevering 1", :description => "een proef aflevering", :channel_id => 1, :live => false ) unless Episode.exists?
Challenge.create(:title => "Challenge 1", :description => "een proef challenge", :channel_id => 1 ) unless Challenge.exists?
Solution.create(:title => "Solution 1", :description => "een proef oplossing", :challenge_id => 1 ) unless Solution.exists?



Post.create(:title => "Missed it live? No problem. Join Open Journalism about #SudanRevolts", :description => "There is a big crisis and revolt going on in Sudan at the moment. The issue is complex and the news is scarce and feels distant. In this Open Journalism experiment I need you to help me build the story and make sense of the videos, links, tweets and more that’s going to come in. In the LIVE and INTERACTIVE studio sessions I’m asking the crowd to join me and work together on the story. The topic we’re tackling: #Sudanrevolts & the bombattacks by the Sudanese government in Southern Kordofan/Blue Nile/Nuba in Sudan. https://twitter.com/#!/search/%23sudanrevolts If you feel connected to the story, are a Sudanese activist, blogger or eyewitness, if you know Sudanese in the diaspora that can make sense of the news, please join in and leave a message in the comments.", :channel_id => 1) unless Post.exists?
Blogitem.create(:item_type => "tekst", :body => "Starting Point of this Open Journalism Experiment is this newspaper article which appeared in Dutch Newspaper NRC. Its my aim to rewrite this article by giving it digital content that is made by the crowd and me. I want this article not to be an end product, but the beginning of a full & interactive coverage of a story which is evolving as we speak. The reader can add to the story so the story is continuous." ) unless Blogitem.exists?




#teksten
Text.update_by_key("new_idea", :description => "Deze tekst komt te staan op de 'maak een nieuw idee' pagina.", :allow_title => false, :allow_body => true, :allow_images => false, :title => "Nieuw Idee")
Text.update_by_key("new_solution", :description => "Deze tekst komt te staan op de 'maak een nieuwe oplossing' pagina.", :allow_title => false, :allow_body => true, :allow_images => false, :title => "Nieuwe oplossing")
Text.update_by_key("ideas_and_challenges", :description => "Deze tekst komt te staan op de 'programma' pagina wanneer er geen specifieke tekst is ingevuld voor de ideeën en challenges voor dit programma.", :allow_title => false, :allow_body => true, :allow_images => false, :title => "ideeën en uitdagingen")
Text.update_by_key("homepage", :description => "Deze tekst komt bovenaan de homepagina te staan.", :allow_title => true, :allow_body => true, :allow_images => false, :title => "homepagina")

#statische paginas
Text.update_by_key("about", :description => "Deze tekst komt op de 'about' pagina te staan.", :allow_title => true, :allow_body => true, :allow_images => true, :title => "about")
Text.update_by_key("contact", :description => "Deze tekst komt op de 'contact' pagina te staan.", :allow_title => true, :allow_body => true, :allow_images => true, :title => "contact")
Text.update_by_key("karma", :description => "Deze tekst komt op de 'karma' pagina te staan.", :allow_title => true, :allow_body => true, :allow_images => false, :title => "karma")

#karma fases
Text.update_by_key("karma_col_1", :description => "Dit is de tekst voor het eerste karma niveau.", :body => "nog in te vullen", :allow_title => true, :allow_body => true, :allow_images => false, :title => "karma fase 1")
Text.update_by_key("karma_col_2", :description => "Dit is de tekst voor het tweede karma niveau.", :body => "nog in te vullen", :allow_title => true, :allow_body => true, :allow_images => false, :title => "karma fase 2")
Text.update_by_key("karma_col_3", :description => "Dit is de tekst voor het derde karma niveau.", :body => "nog in te vullen", :allow_title => true, :allow_body => true, :allow_images => false, :title => "karma fase 3")
Text.update_by_key("karma_col_4", :description => "Dit is de tekst voor het vierde karma niveau.", :body => "nog in te vullen", :allow_title => true, :allow_body => true, :allow_images => false, :title => "karma fase 4")