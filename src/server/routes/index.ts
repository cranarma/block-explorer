import * as express from 'express';
import model from '../api/model'
import { check }  from 'express-validator'
import addValidator from '../api/expressValidators/addValidator'

export const routesPrefix = '/api/v1'

export default express.Router()
  .get(`${routesPrefix}/validators/:address`, model.getValidator)
  //@ts-ignore
  .post(`${routesPrefix}/validators/`, addValidator, model.addValidator)
  .get(`${routesPrefix}/validators`, model.getValidators)
  .get('/', (req, res) => {
    res.status(404).send('Expected a path');
  })
