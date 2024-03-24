ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email, :notes, :image

  remove_filter :image_attachment, :image_blob

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end
end
