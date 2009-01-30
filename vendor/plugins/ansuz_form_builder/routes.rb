namespace :admin do |admin|
  admin.resources :form_builders do |form_builder|
    form_builder.resources :form_fields
    form_builder.resources :form_responses
  end
  admin.resources :form_field_text_fields
  admin.resources :form_field_text_areas
end
resources :form_builders, :member => [:submit]
