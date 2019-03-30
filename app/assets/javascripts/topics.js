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
  .then(resp => resp.json())
  .then(topic => {
      $('#topic_container').html('')
      let newTopic = new Topic(topic)
      let topicHtml = newTopic.renderShow()
      $('#topic_container').append(topicHtml)//Inject the HTML to the body of the page using append
    })
  })
}

//Constructor Function to create objects
function Topic(topic) {
  this.id = topic.id
  this.timeline = topic.timeline
  this.title = topic.title
  this.lab = topic.lab
  this.study_group = topic.study_group
}
