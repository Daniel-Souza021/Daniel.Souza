namespace :utils do
  desc "Popular o banco de dados"
  task seed: :environment do
    puts "Gerando os tipos de contato (Contacts) ..."
    100.times do |i|
      Contact.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          kind: Kind.all.sample,
          rmk: LeroleroGenerator.sentence([1,2,3].sample)
      )
    end
    puts "Gerando os tipos de contato (Contacts) ... [FEITO!]"

    puts "Gerando os tipos de endereços (addresses) ..."
    Contact.all.each do |contact|
    Address.create!(
            street:Faker::Address.street_address,
            city: Faker::Address.city,
            state: Faker::Address.state_abbr,
            contact: contact
    )
    end
    puts "Gerando os tipos de endereços (addresses) ... [FEITO!]"


    puts "Gerando os tipos de telefone (Phones) ..."
      Contact.all.each do |contact|
        Random.rand(1..3).times do |i|
          Phone.create!(
                        phone: Faker::PhoneNumber.cell_phone,
                        contact: contact
    )
      end
    end
    puts "Gerando os tipos de telefone (Phones) ...[FEITO]!"

    #t.string :phone
    #t.references :contact, index: true


end

  end

