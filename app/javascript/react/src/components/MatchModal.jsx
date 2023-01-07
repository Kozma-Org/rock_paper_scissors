import React, { useEffect, useState } from "react";
import * as ReactDOM from 'react-dom'
import Hand from "./hand";

function MatchModal(props) {
    const [opponent_hand, setOpponentHand] = useState(null);

    useEffect(() => {
        props.setModalHeader("WAITING CURB’S CHOOSE");
        const requestOptions = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ matches: { player_hand: props.hand } })
        };
        fetch('http://localhost:3000/api/v1/matches', requestOptions)
            .then(response => response.json())
            .then(data => {
                setOpponentHand(data.opponent_hand);
                props.setModalHeader(data.game_status);
            });
        }, []);

    return(
        <div className="row p-3 pb-3">
            <Hand customText="You" type={props.hand}/>
            <div className="col-lg-4 rps-hand offset-lg-4">
                <div className={opponent_hand ? "rps-" + opponent_hand + "-hand" : "rps-loader"}></div>
                <div className="rps-curb mb-2"></div>
            </div>
        </div>
    )
}

export default MatchModal