// When document is completly loaded
$(document).ready(() => {
 alert("Loaded! ")
 indexTopics()
 showTopic()
})

//get all topics via Fetch Get request indexTopics(), sends a GET request as soon as the page loads to retrieve all Topics.
//We iterate over the response, creating each a Topic object for each node and rendering it to the page using JQuery.
function indexTopics(){
  $('.topics_data').on('click', function(event){
    event.preventDefault()
    history.pushState(null, null, 'topics')

  fetch(`/topics.json`)
    .then(resp => resp.json())
    .then(topics => {
      $('#topic_container').html('')

      topics.forEach(topic => {
        let newTopic = new Topic(topic)
        let topicHtml = newTopic.formatTopic()
        $('#topic_container').append(topicHtml)
      })
    })
  })
}

//showTopic() function sends a GET request to the application.
//The JSON response is passed as an argument to create a new Topic.
//The showTopic template is rendered using protoptype newTopicForm and then injected into the page.
function showTopic() {
  $(document).on('click','.show_topics', function(event){
    event.preventDefault()
    let id = $(this).attr('data-id')

  fetch(`/topics/${id}.json`)
    .then(resp => resp.json())
    .then(topic => {
      $('#topic_container').html('')
        let newTopic = new Topic(topic)
        let topicHtml = newTopic.newTopicForm()
        $('#topic_container').append(topicHtml)
    })
  })
}

//Submit topics via ajax
//It serializes the data and sends a GET request to the application. The responses is a JSON object, which is used to create a new Topic  object.
//The newTopicForm prototype template is rendered using this object’s attributes and injected into the page.

$(function() {
  $('form#new_topic').on('submit',function (event) {
    event.preventDefault()

    const values = $(this).serialize()
    $.post('/topics', values).done(function(data) {
      console.log(data)
    $('#topic_container').html(" ")

    const newTopic = new Topic(data)
    const htmltoAdd = newTopic.newTopicForm()
    $('#topic_container').html(htmltoAdd)
    })
  })
})


function Topic(topic) {
  this.id = topic.id
  this.timeline = topic.timeline
  this.title = topic.title
  this.lab = topic.lab
  this.study_group = topic.study_group
  this.subjects = topic.subjects
}


//form submited with Ajax

$(function() {
  $('form#new_topic').on('submit',function (e) {
    e.preventDefault()

    const values = $(this).serialize()
    $.post('/topics', values).done(function(data) {
      console.log(data)
    $('#topic_container').html(" ")

    const newTopic = new Topic(data)
    const htmltoAdd = newTopic.renderShow()
    $('#topic_container').html(htmltoAdd)
    })
  })
})
