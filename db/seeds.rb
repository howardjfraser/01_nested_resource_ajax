Person.delete_all

8.times do
  name = "#{FFaker::Name.first_name} #{FFaker::Name.last_name}"
  Person.create! name: name, job_title: FFaker::Job.title, bio: FFaker::Lorem.paragraph
end

Person.all.each do |person|
  (0..8).to_a.sample.times do
    created_at = (0..300).to_a.sample.minutes.ago
    person.messages.create! body: FFaker::Lorem.sentence, created_at: created_at
  end
end
