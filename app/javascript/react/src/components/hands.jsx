import React, { useState } from "react";
import Hand from './hand'
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import MatchModal from "./MatchModal";

function Hands() {
    const [show, setShow] = useState(false);
    const [hand, setHand] = useState(null);
    const [modalHeader, setModalHeader] = useState("WAITING CURB’S CHOOSE");

    const handleClose = () => {
        setHand(null);
        setShow(false);
    }
    const handleShow = (hand) => {
        setHand(hand);
        setShow(true);
    }

    return(
        <div className="row p-3 pb-3">
            <Hand type='rock' canClick="true" onHandleShow={handleShow}/>
            <Hand type='paper' canClick="true" onHandleShow={handleShow}/>
            <Hand type='scissors' canClick="true" onHandleShow={handleShow}/>
            <Modal
                show={show}
                onHide={handleClose}
                backdrop="static"
                keyboard={false}
            >
                <Modal.Header closeButton>
                    {modalHeader}
                </Modal.Header>
                <Modal.Body>
                    <MatchModal hand={hand} setModalHeader={setModalHeader} />
                </Modal.Body>
                <Modal.Footer>
                    <div className="mx-auto">
                        <Button variant="primary" onClick={handleClose}>
                            Ok
                        </Button>
                    </div>
                </Modal.Footer>
            </Modal>
        </div>
    )
}

export default Hands