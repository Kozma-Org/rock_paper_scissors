import * as React from 'react'
import * as ReactDOM from 'react-dom'

const RockPaperScissorsApp = () => {
    return(
        <h1>
            Hello React App!
        </h1>
    )
}

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(<RockPaperScissorsApp />, document.getElementById('rock-paper-scissor'))
})

export default RockPaperScissorsApp