require_relative 'seeders/category_seeder'
require_relative 'seeders/brand_seeder'
require_relative 'seeders/option_seeder'
require_relative 'seeders/vendor_seeder'
require_relative 'seeders/user_seeder'

initDefaultUser
create_brands
create_options
create_categories
create_vendors 50
