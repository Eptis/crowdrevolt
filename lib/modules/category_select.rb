module CategorySelect
  def self.included(base)
    base.class_eval do
      has_many :categorizations, :as => :categorization, :dependent => :destroy
      has_many :categories, :through => :categorizations
      
      def category_names
        categories.collect(&:name).join(", ")
      end
    end
  end
end