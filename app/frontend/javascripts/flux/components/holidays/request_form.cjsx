Calendar = require '../calendar/calendar'
CalendarStore = require '../../stores/calendar_store'

RequestForm = React.createClass
  displayName: 'RequestForm'

  _renderSelectedDates: ->
    return unless @props.selectedDates.length > 0

    dates = @props.selectedDates.map (date) ->
      <li>{date.format("dddd, MMMM Do YYYY")}</li>

    <div>
      <h5>Selected dates</h5>
      <ul className="selected-dates">
        {dates}
      </ul>
    </div>

  render: ->
    <div className="holidays-modal">
      <form action="">
        <header>
          <h3>Request holidays</h3>
        </header>
        <div className="data-wrapper">
          <div className="calendar-wrapper">
            <h5>Select desired dates:</h5>
            <Calendar />
            {@_renderSelectedDates()}
          </div>
          <div className="holidays-data-wrapper">
            <h5>Want to add a comment?</h5>
            <textarea cols="30" name="" placeholder="Comments..." rows="10"></textarea>
          </div>
        </div>
        <div className="actions">
          <button className="btn" type="submit">
            Create request
          </button>
        </div>
      </form>
    </div>

module.exports = Marty.createContainer RequestForm,
  listenTo: [
    CalendarStore
  ]

  fetch:
    selectedDates: ->
      CalendarStore.state.selectedDates

  failed: (errors) ->
    console.log 'Failed rendering Calendar'
    console.log errors
