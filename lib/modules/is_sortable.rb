module IsSortable
  def self.included(base)
    base.class_eval do
      default_scope order(:position)
      
      def self.sort(ids)
        update_all(['position = FIND_IN_SET(id, ?)', ids.join(',')], { :id => ids })
      end
    end
  end
end