require "administrate/base_dashboard"

class NominationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    award: Field::BelongsTo,
    play: Field::BelongsTo,
    id: Field::Number,
    nominee: Field::String,
    role: Field::String,
    open: Field::Boolean,
    approved: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :user,
    :award,
    :play,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :user,
    :award,
    :play,
    :nominee,
    :role,
    :open,
    :approved,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :award,
    :play,
    :nominee,
    :role,
    :open,
    :approved,
  ]

  # Overwrite this method to customize how nominations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(nomination)
  #   "Nomination ##{nomination.id}"
  # end
end
