def create_options
    elements = [
        'Color',
        'Size',
    ]

    puts 'Seeding options...'
    elements.each do |element|
        Option.create(name: element, slug: element.parameterize)
    end

    puts "#{elements.count} options seeded"
end