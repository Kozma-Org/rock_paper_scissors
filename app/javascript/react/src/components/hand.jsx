import * as React from 'react'
import * as ReactDOM from 'react-dom'

const Hand = (props) => {
    return(
        <div className="col-lg-4 rps-hand">
            <div className={"rps-" + props.type + "-hand"} onClick={() => props.canClick && props.onHandleShow(props.type)}>
            </div>
            <div className="rps-name text-capitalize mb-2">{props.customText || props.type}</div>
        </div>
    )
}

export default Hand