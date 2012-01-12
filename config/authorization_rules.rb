authorization do
  
role :admin do
    has_permission_on [:users,:clients], :to => :menage
 end
  
  role :guest do
    has_permission_on :all, :to => [:index, :show]
  end
end
