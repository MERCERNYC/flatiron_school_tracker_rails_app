// When document is completly loaded
$(document).ready(() => {
 alert("Loaded! ")
 indexTopics()
 showTopic()
 sortTopics()
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

function sortTopics() {
  $('.sort_data').on("click", function(e) {

    e.preventDefault()

    fetch('/topics.json')
    .then(resp => resp.json())
    .then(topics => {
      $('#topic_container').html('')


      topics.sort(function(a, b) {
        const nameA = a.title.toUpperCase(); // ignore upper and lowercase
        const nameB = b.title.toUpperCase(); // ignore upper and lowercase
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
        // names must be equal
        return 0;
      });

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



//submiot
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

Topic.prototype.formatTopic = function() {
  return (`

   <tr>
      <td><a href="/topics/${this.id}" data-id="${this.id}" class="show_topics"><h1>${this.title}</h1></a></td>
      <td><button><a href="/topics/${this.id}/edit" data-id="${this.id}" class="edit_topic"> Edit</a></button></td>
      <td><button><a href="/topics/${this.id}" data-id="${this.id}" class="delete_topic" data-method="delete">Delete</a></button></td>
    </tr>
    `)
}


Topic.prototype.newTopicForm = function() {
  let subjectsHtml = this.subjects.map(subject => {
    return (`
      <div>${subject.name}</div>
    `)
  }).join(' ')

    return(`

    <h1>Topic Created</h1>

    <tr>
     <td><strong>Timeline:</strong> ${this.timeline}</td></br>
     <td><strong>Title:</strong> ${this.title}</td></br>
     <td><strong>Lab:</strong> ${this.lab}</td></br>
     <td><strong>Study Group:</strong> ${this.study_group}</td></br></br>
     <td><strong>Subjects:</strong><ul>${subjectsHtml}</ul></td></br></br>



  `)
}
