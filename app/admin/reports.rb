ActiveAdmin.register Report do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  scope("Today") { |scope| scope.where(created_at: Date.today.all_day) }
  scope("Yesterday") { |scope| scope.where(created_at: 1.day.ago.all_day) }
  scope("Last 15 Days") do |scope|
    end_of_day_today = Date.today.end_of_day
    start_date = 15.days.ago.beginning_of_day
    scope.where(created_at: start_date..end_of_day_today)
  end
  scope :all, default: true

  permit_params :name, :department_id 
 
  index do
    selectable_column
    id_column
    column :name
    column :department_id do |obj|
      Department.find(obj.department_id).department_name
 end
    column :created_at
    actions
  end

  
end

