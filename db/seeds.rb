names = [
  'Get the bread',
  'Get the milk',
  'Learn Rails',
  'Go to Karaoke'
]

names.each do |name|
  if !Task.find_by(name: name)
    Task.create!({
      name: name,
      description: 'A meme oriented task',
      due_on: Date.today + rand(7).days
    })
  end
end
