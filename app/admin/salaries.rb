ActiveAdmin.register Salary do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  
  actions :all, :except => [:create,:new]

  permit_params :name, :salary, :department_id
 

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :salary
   
    column :department
    column :created_at
    actions
  end
  

  filter :name
  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      
      f.input :name
      f.input :email
      f.input :salary
      f.input :department, as: :select, collection: Department.where.not(department_name: 'admin').map{ |a| [a.department_name, a.id] }
      
    end
    f.actions
  end
  
end
