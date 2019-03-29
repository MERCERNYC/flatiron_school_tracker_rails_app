// $(function() {
//  console.log('topics.js loading')
// });

$(document).ready(() => {
 alert("yo!")
 listTopics()
 alert("You go girl! ")
 getTopicsIndex()
 postTopicsShow()
})

//or use function with no arrow
// function listTopics (){}
const listTopics = () => {
  $('.topics_data').on('click', function(event){
    event.preventDefault()
//Click event Topics

const getTopicsIndex = () => {
   $('.topics_data').on('click', function(e){
    e.preventDefault()
    history.pushState(null, null, 'topics')
    // getTopics()
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

const postTopicsShow = () => {
  $(document).on('click', '.show_topics', function(e){
  e.preventDefault()
  let id = $(this).attr('data-id')
  fetch(`/topics/${id}.json`)
  .then(resp => resp.json())
  .then(topic => {
      $('#topic_container').empty()
      let newTopic = new Topic(topic)
      let topicHtml = newTopic.renderShow()
      $('#topic_container').append(topicHtml)//Inject the HTML to the body of the page using append
    })
  })
}

//create object for topic and subject

function Topic(topic) {
  this.id= topic.id
  this.id = topic.id
  this.timeline = topic.timeline
  this.title = topic.title
  this.lab = topic.lab
  this.study_group = topic.study_group
}

Topic.prototype.formatTopic = function(){
Topic.prototype.renderIndex = function() {
  let topicHtml = `

   <tr>
      <td><a href="/topics/${this.id}" data-id="${this.id}" class="show_topics"><h1>${this.title}</h1></a></td>

      <td><button><a href="/topics/${this.id}/new" data-id="${this.id}" class="update_topic"> Add New Topic</a></button></td>
      <td><button><a href="/topics/${this.id}/edit" data-id="${this.id}" class="update_topic"> Edit</a></button></td>
      <td><button><a href="/topics/${this.id} " data-id="${this.id}" class="delete_topic" data-method="delete">Delete</a></button></td>
    </tr>
    `
  return topicHtml
}
  let topicHtml = `

  <tr>
    <td><a href="/topics/${this.timeline}" data-id="${this.id}" </a></td>
  </tr>

    `
    return topicHtml
}
