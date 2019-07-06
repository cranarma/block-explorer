import { Pool, QueryResult } from 'pg'

import dbCredentials from './dbCredentials'
import { check, validationResult, query} from 'express-validator'

const pool = new Pool(dbCredentials)

export interface Entry{
  [s: string]: string
}

//TODO: add types
//@ts-ignore
export const getHome = (request, response) => {
  response.status(200).end('All done, dawg!')
}

//TODO: add types
//@ts-ignore
export const getValidators = (request, response) => {
    pool.query(`SELECT id, 
        data->'address' AS address,
        data->'pub_key' AS pub_key,
        data->'voting_power' AS voting_power,
        data->'proposer_priority' AS proposer_priority 
      FROM validator`, (error, results) => {
      if (error)
        throw error

        response.status(200).json(results.rows)
    })
}

type getValidatorRowCallback = (results: QueryResult) => any

export const getValidatorRow = (address: string, callBack: getValidatorRowCallback) => {
  pool.query(`SELECT
                id,
                data->'address' AS address,
                data->'pub_key' AS pub_key,
                data->'voting_power' AS voting_power,
                data->'proposer_priority' AS proposer_priority
              FROM validator WHERE data->>'address' = $1`, [address], (error, results) => {
    if (error){
      throw error
    }
    
    callBack(results)
  })
}
//TODO: add types
//@ts-ignore
export const getValidator = (request, response,) => {
  const address = request.params.address
  getValidatorRow(address, (results) => {
    response.status(200).json(results.rows)
  })
}

//@ts-ignore
export const deleteValidator = (rowId: number, callBack: Function) => {
  pool.query(`DELETE FROM validator
              WHERE id = $1`, 
    [rowId], (error, results) => {
      if(error){
        throw error
      }
      callBack()
  })
}

interface InsertValidatorArgs{
  validatorAddress: string
  publicKey: string
  votingPower: number
  proposerPriority: number
}

//@ts-ignore
export const insertValidator = (args: InsertValidatorArgs, callBack: Function) => {
  console.log(`What am I going to inserrrr`, args)
  const queryArgs = {
    address: args.validatorAddress,
    pub_key: {
      type: 'tendermint/PubKeyEd25519',
      value: args.publicKey,
    },
    voting_power: args.votingPower,
    proposer_priority: args.proposerPriority,
  }
  
  pool.query(`INSERT INTO validator
        (id, data)
      VALUES (DEFAULT, $1)`, 
    [JSON.stringify(queryArgs)], (error, results) => {
      if(error){
        throw error
      }
      callBack()
  })
}

//TODO: add types
//@ts-ignore
export const addValidator = (request, response) => {
  // console.log(`What's in the body`, request.body)
  // return response.status(422).json(request.body)
  const errors = validationResult(request)
  if (!errors.isEmpty()) {
    return response.status(422).json({ errors: errors.array() })
  }

  const address = request.body.validatorAddress

  getValidatorRow(address, results => {
    console.log(`There are ${results.rowCount} rows`)
    if(results.rowCount > 0){
      console.log(results.rowCount, results.rows[0].voting_power, request.body.votingPower, results.rows[0].voting_power != request.body.votingPower)
      if(results.rows[0].voting_power != request.body.votingPower){
        deleteValidator(results.rows[0].id, () => {
          console.log(`Done deleting, now I'm going to insert`)
          insertValidator(request.body, () => {
            console.log(`I'm done inserting!`)
            response.status(200).end()
          })
        })
      }
      else{
        response.status(200).end()
      }
    }
    else{
      insertValidator(request.body, () => {
        response.status(200).end()
      })
    }
  })
}

export default {
  getValidators,
  getValidator,
  addValidator
}
