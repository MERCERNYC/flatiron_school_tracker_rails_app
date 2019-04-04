// this refers to window.document
$(document).ready(() => {
 alert("You go girl! ")
 getTopicsIndex()
 postTopicsShow()
})

//Render Index Page
const getTopicsIndex = () => {
   $('.topics_data').on('click', function(e){
    e.preventDefault()
    history.pushState(null, null, 'topics')

    fetch(`/topics.json`)
    .then(resp => resp.json())
    .then(topics => {
      $('#topic_container').html('')

      topics.forEach(topic => {
        let newTopic = new Topic(topic)
        let topicHtml = newTopic.renderIndex()
        $('#topic_container').append(topicHtml)//Inject the HTML to the body of the page using append
      })
    })
  })
}

//Render Show Page
const postTopicsShow = () => {
  $(document).on('click', '.show_topics', function(e){
  e.preventDefault()
  let id = $(this).attr('data-id')

  fetch(`/topics/${id}.json`)
  .then(resp => resp.json())// parses JSON response into native Javascript objects
  .then(topic => {
      $('#topic_container').html('')
      let newTopic = new Topic(topic)
      let topicHtml = newTopic.renderShow()
      $('#topic_container').append(topicHtml)//Inject the HTML to the body of the page using append
    })
  })
}

//Method on the prototype for JS objects

//INDEX
Topic.prototype.renderIndex = function() {
  let topicHtml = `

   <tr>
      <td><a href="/topics/${this.id}" data-id="${this.id}" class="show_topics"><h1>${this.title}</h1></a></td>
      <td><button><a href="/topics/${this.id}/edit" data-id="${this.id}" class="update_topic"> Edit</a></button></td>
      <td><button><a href="/topics/${this.id}" data-id="${this.id}" class="delete_topic" data-method="delete">Delete</a></button></td>
    </tr>
    `
  return topicHtml
}

//SHOW
Topic.prototype.renderShow = function() {
//mapping over the subjects array
let subjectsHtml = this.subjects.map(subject => {
  return (`
    <div>${subject.name}</div>
    `)
}).join(' ')// creates and returns a new string by concatenating all of the elements in an array

  let topicHtml = `

  <h1>Topic Created</h1>

  <tr>
   <td><strong>Timeline:</strong> ${this.timeline}</td></br>
   <td><strong>Title:</strong> ${this.title}</td></br>
   <td><strong>Lab:</strong> ${this.lab}</td></br>
   <td><strong>Study Group:</strong> ${this.study_group}</td></br></br>
   <td><strong>Subjects:</strong><ul>${subjectsHtml}</ul></td></br></br>

   <button><a href="/topics" class="topic_index">Back to All Topics</a></button>
  </tr>

  `
  return topicHtml
}


//Constructor Function to create objects
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
