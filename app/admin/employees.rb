ActiveAdmin.register Employee do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # actions :all, :except => [:create,:new]
 
  permit_params :name, :email, :password, :contact, :address, :salary, :department_id
 


  index do
    selectable_column
    id_column
    column :name
    column :email
    column :password
    column :contact
    column :address
    column :department_id do |obj|
         Department.find(obj.department_id).department_name
    end
    column :created_at
    actions
  end
  

  filter :name
  filter :email
  filter :password
  filter :contact
  filter :address
  filter :created_at

  form do |f|
    f.inputs do
      
      f.input :name
      f.input :email
      f.input :password
      f.input :contact
      f.input :address
      f.input :department, as: :select, collection: Department.where.not(department_name: 'admin').map{ |a| [a.department_name, a.id] }
      
    end
    f.actions
  end

  show do

      attributes_table do
      row :name
      row :email
      row :password
      row :contact
      row :address
      row :department
      row :created_at
    
      end
    
   end
  
end
