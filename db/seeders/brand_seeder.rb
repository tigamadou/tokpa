def create_brands
    elements = [
        '3M',
        'Alienware',
        'Amazon',
        'AMD',
        'Analog Devices',
        'Apple',
        'Audiovox',
        'Avaya',
        'Averatec',
        
    ]

    puts 'Seeding brands...'
    elements.each do |element|
        brand = Brand.create(name: element, slug: element.parameterize, activated: true)
        # brand.image.attach(io: File.open("app/assets/images/brand.jpg"), filename: 'brand.jpg',  identify: false)
    end

    puts "#{elements.count} brands seeded"
end