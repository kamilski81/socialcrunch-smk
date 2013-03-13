require 'spec_helper'

describe Question do
  before(:all) do
    puts "kamil***"
  end

  after(:each) do
    puts 'chmiel*****'
    DatabaseCleaner.clean
  end
  before(:each) do
    puts "blah*****"
  end

  describe "create!" do
    it "should set all the fields correctly" do
      Question.create!( name: "Pamela Anderson", description: "Former Playboy model",
                        image: "url.com", gender: Constants::FEMALE, sequence_num: 5)
      expected = Question.last
      expected.name.should == "Pamela Anderson"
      expected.description.should == "Former Playboy model"
      expected.image.should == "url.com"
      expected.gender.should == Constants::FEMALE
      expected.sequence_num.should == 5
    end
  end

  describe "#get_all_questions_ids_of_user" do
    3.times do
      FactoryGirl.create(:question)
    end

    session_id = "session_id_1234"

    first_question = Question.first
    last_question  = Question.last

    FactoryGirl.create(:response, question: first_question, session_id: session_id)
    FactoryGirl.create(:response, question: last_question, session_id: session_id)

    qids = Question.get_users_responses(session_id)

    qids.size.should == 2
    qids[0].should == first_question
    qids[1].should == last_question
  end
end