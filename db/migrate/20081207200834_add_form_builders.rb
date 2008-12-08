class AddFormBuilders < ActiveRecord::Migration
  def self.up
    # FormBuilders
    create_table :form_builders do |t|
      t.string :name
      t.string :submit_text

      t.timestamps
    end

    create_table :form_fields do |t|
      # FormBuilders have many FormFields
      t.integer :form_builder_id
      # FormFields are polymorphic on field, and they act as list
      t.integer :position
      t.string  :field_type
      t.integer :field_id

      t.timestamps
    end

    # FormFieldTextFields hold any text fields for the form
    create_table :form_field_text_fields do |t|
      t.string :label
    end

    # FormFieldTextAreas hold any text areas for the form
    create_table :form_field_text_areas do |t|
      t.string :label
    end

    # FormBuilderResponses are an individual 'filled out form'
    create_table :form_builder_responses do |t|
      t.integer :form_builder_id

      t.timestamps
    end

    # FormFieldResponses are responses to a given FormField
    create_table :form_field_responses do |t|
      t.integer :form_builder_response_id
      t.integer :form_field_id
      t.string  :string
      t.boolean :boolean
      t.text    :text
    end
  end

  def self.down
    drop_table :form_field_responses
    # FormFieldResponses are responses to a given FormField

    drop_table :form_builder_responses
    # FormBuilderResponses are an individual 'filled out form'

    drop_table :form_field_text_fields
    # FormFieldTextFields hold any text fields for the form

    drop_table :form_fields

    drop_table :form_builders
    # FormBuilders
  end
end
