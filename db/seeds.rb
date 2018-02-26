development_category = Category.find_or_create_by!(title: 'Development', color: '163abc')

development_subcategories = [
  development_category.subcategories.find_or_create_by!(title: 'Programming'),
  development_category.subcategories.find_or_create_by!(title: 'Specs'),
  development_category.subcategories.find_or_create_by!(title: 'Planning'),
  development_category.subcategories.find_or_create_by!(title: 'Other')
]

meeting_category = Category.find_or_create_by!(title: 'Meeting', color: 'f9dc00')

meeting_subcategories = [
  meeting_category.subcategories.find_or_create_by!(title: 'Stand-up'),
  meeting_category.subcategories.find_or_create_by!(title: 'Sprint'),
  meeting_category.subcategories.find_or_create_by!(title: 'Interview'),
  meeting_category.subcategories.find_or_create_by!(title: 'Other')
]

push_category = Category.find_or_create_by!(title: 'Push', color: '00e200')

push_subcategories = [
  push_category.subcategories.find_or_create_by!(title: 'Staging'),
  push_category.subcategories.find_or_create_by!(title: 'Production'),
  push_category.subcategories.find_or_create_by!(title: 'Hotfix')
]

break_category = Category.find_or_create_by!(title: 'Break', color: 'd30000')

break_category = [
  break_category.subcategories.find_or_create_by!(title: 'Lunch'),
  break_category.subcategories.find_or_create_by!(title: 'Other')
]
