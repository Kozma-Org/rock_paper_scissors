import * as React from 'react'
import { createRoot } from 'react-dom/client';
import RPSTitle from "./rps_title";
import RPSDescription from "./rps_description";
import Hands from "./hands";

const RockPaperScissorsApp = () => {
    return(
        <div className="col-lg-6 mx-auto">
            <RPSTitle />
            <RPSDescription />
            <div className="rps-bet text-uppercase text-center">
                <span>Select your bet</span>
            </div>
            <Hands />
        </div>
    )
}

document.addEventListener('DOMContentLoaded', () => {
    const root = createRoot(document.getElementById('rock-paper-scissor'));
    root.render(<RockPaperScissorsApp />);
})

export default RockPaperScissorsApp