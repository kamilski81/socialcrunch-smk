if Rails.env.development?
  Question.delete_all

  Question.create!( name: "Pamela Anderson", description: "Former Playboy model",
                    image: "url.com", gender: Constants::FEMALE, sequence_num: 1)
  Question.create!( name: "Jen Gardner", description: "actress",
                    image: "url2.com", gender: Constants::FEMALE, sequence_num: 1)
  Question.create!( name: "Anna Kournikova", description: "tennis player",
                    image: "url3.com", gender: Constants::FEMALE, sequence_num: 1)

  Question.create!( name: "Jay-Z", description: "Killah",
                    image: "url5.com", gender: Constants::MALE, sequence_num: 2)
  Question.create!( name: "Justin Timberlake", description: "suit & tie",
                    image: "url6.com", gender: Constants::MALE, sequence_num: 2)
  Question.create!( name: "Michael jackson", description: "dead....too soon",
                    image: "url7.com", gender: Constants::MALE, sequence_num: 2)

  Question.create!( name: "Bobanna", description: "Former Playboy model",
                    image: "url.com", gender: Constants::FEMALE, sequence_num: 3)
  Question.create!( name: "Nina", description: "actress",
                    image: "url2.com", gender: Constants::FEMALE, sequence_num: 3)
  Question.create!( name: "Slaya", description: "tennis player",
                    image: "url3.com", gender: Constants::FEMALE, sequence_num: 3)
end