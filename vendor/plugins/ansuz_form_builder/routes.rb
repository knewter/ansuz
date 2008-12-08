namespace :admin do |admin|
  admin.resources :form_builders do |form_builder|
    form_builder.resources :form_fields
  end
  admin.resources :form_field_text_fields
end
resources :form_builders, :member => [:submit]
