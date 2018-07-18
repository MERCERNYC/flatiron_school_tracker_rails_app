#Flatiron School Tracker Application

#Step 1: Integrate Basic Theme
  -non-dynamic, page with the theme
#Step 2: Allow students to CRUD school Topics
  -create a topic
  -see all their topics
  -show a topic

-generate
  Controller
  model - rails generate model subject description topic_id (create model and migration files)
  resource

#Step 3: Add subjects to topics

Topic has a link that show the subjects and go back to topics_path
Make the subjects in a topic real
 - a topic has many subjects and every subject belongs to a topic

 Topics
   2 Ruby
   subjects has an (id, name, topic_id)

   Example:
   id   description  topic_d
   1      methods       2
   1      Loops         2

Test belongs_to :topic
   topic = Topic.find(2)
   method = Subject.create
   method.description = "method"
   method.topic_id = topic.id
   method
   method.save
   true
   method.topic (method added with the belongs_to Association() returns the associated object)
   <Topic id: 2, timeline: "Week 1", title: "Ruby", lab: "completed", study_group: "Today", created_at: "2018-07-18 14:04:29", updated_at: "2018-07-18 14:04:29">

  Association=(associated) assigns the associated object
    loop  = Subject.create(:description => "Loops") loop is an instance of Association


  Nested Resource

  TOPIC/topics/:id/subjects
