//form submited with Ajax

$(function() {
  $('form#new_topic').on('submit',function (e) {
    e.preventDefault()

    const values = $(this).serialize()
    $.post('/topics', values).done(function(data) {
    $('#topic_container').html(" ")

    const newTopic = new Topic(data)
    const htmltoAdd = newTopic.renderShow()
    $('#topic_container').html(htmltoAdd)
    })
  })
})
