import { check }  from 'express-validator'

const addValidator = [
    check('validatorAddress').isLength({ min: 5 }),
    check('publicKey').isLength({ min: 44 }),
    check('votingPower').isNumeric(),
    check('proposerPriority').isNumeric()
]

export default addValidator