# sample tasks
3.times do |n|
  Task.create(name: "unfinished task #{n+1}")
end

2.times do |n|
  Task.create(name: "finished task #{n+1}", done: true)
end
