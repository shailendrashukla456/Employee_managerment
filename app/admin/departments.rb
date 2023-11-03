ActiveAdmin.register Department do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :department_name
  
  index do
    selectable_column
    id_column
    column :department_name
    column :created_at
    
    
    actions
  end

  filter :department_name
  

  form do |f|
    f.inputs do
      f.input :department_name
     
    end
    f.actions
  end
end
