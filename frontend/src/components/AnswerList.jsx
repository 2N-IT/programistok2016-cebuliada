import React from 'react';
import Answer from './Answer';

const AnswerList = (props) => {

  return (
    <div className='col-xs-10 answers-list'>
      <table className="text-center">
        <tbody className='answers'>
          {props.answears.map(({id, title, points}) => {
            return (
              <Answer
                key={id}
                id={id}
                title={title}
                points={points}
                validAnswers={props.valid_answers}
              />
              )
          })}
        </tbody>
      </table>
    </div>
  )
}

export default AnswerList
