#Flatiron School Tracker Application

#Step 1: Integrate Basic Theme
  -non-dynamic, page with the theme
#Step 2: Allow students to CRUD school Topics
  -create a topic
  -see all their topics
  -show a topic

-generate
  Controller
  model
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
