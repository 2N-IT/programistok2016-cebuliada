import React from 'react';

const Answer = (props) => {
  return (
    <tr
      id={`answer-${props.id}`}
      className={props.answerClass}
    >
      <td>{props.title}</td>
      <td>{props.points}</td>

    </tr>
    )
}
export default Answer
