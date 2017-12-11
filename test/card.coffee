global.window = {
  location: {
    host: ''
  }
}

{ expect } = require 'chai'

{
  cardFromNumber
  cardType
  restrictNumeric
} = require '../'

describe 'card.cardFromNumber', ->
  it 'should work', ->
    # Visa
    res = cardFromNumber 4242424242424242
    res.type.should.eq 'visa'

    # Visa (debit)
    res = cardFromNumber 4000056655665556
    res.type.should.eq 'visa'

    # Mastercard
    res = cardFromNumber 5555555555554444
    res.type.should.eq 'mastercard'

    # Mastercard (2-series)
    res = cardFromNumber 2223003122003222
    res.type.should.eq 'mastercard'

    # Mastercard (debit)
    res = cardFromNumber 2223003122003222
    res.type.should.eq 'mastercard'

    # Mastercard (prepaid)
    res = cardFromNumber 5105105105105100
    res.type.should.eq 'mastercard'

    # American Express
    res = cardFromNumber 378282246310005
    res.type.should.eq 'amex'

    # American Express
    res = cardFromNumber 371449635398431
    res.type.should.eq 'amex'

    # Discover
    res = cardFromNumber 6011111111111117
    res.type.should.eq 'discover'

    # Discover
    res = cardFromNumber 6011000990139424
    res.type.should.eq 'discover'

    # Diners Club
    res = cardFromNumber 30569309025904
    res.type.should.eq 'dinersclub'

    # Diners Club
    res = cardFromNumber 38520000023237
    res.type.should.eq 'dinersclub'

    # JCB
    res = cardFromNumber 3530111333300000
    res.type.should.eq 'jcb'

  it 'should fail', ->
    # JCB
    res = cardFromNumber 1234567812345678
    expect(res).to.not.exist

describe 'card.cardType', ->
  it 'should work', ->
    # Visa
    type = cardType 4242424242424242
    type.should.eq 'visa'

    # Visa (debit)
    type = cardType 4000056655665556
    type.should.eq 'visa'

    # Mastercard
    type = cardType 5555555555554444
    type.should.eq 'mastercard'

    # Mastercard (2-series)
    type = cardType 2223003122003222
    type.should.eq 'mastercard'

    # Mastercard (debit)
    type = cardType 2223003122003222
    type.should.eq 'mastercard'

    # Mastercard (prepaid)
    type = cardType 5105105105105100
    type.should.eq 'mastercard'

    # American Exptypes
    type = cardType 378282246310005
    type.should.eq 'amex'

    # American Exptypes
    type = cardType 371449635398431
    type.should.eq 'amex'

    # Discover
    type = cardType 6011111111111117
    type.should.eq 'discover'

    # Discover
    type = cardType 6011000990139424
    type.should.eq 'discover'

    # Diners Club
    type = cardType 30569309025904
    type.should.eq 'dinersclub'

    # Diners Club
    type = cardType 38520000023237
    type.should.eq 'dinersclub'

    # JCB
    type = cardType 3530111333300000
    type.should.eq 'jcb'

  it 'should fail', ->
    # JCB
    type = cardType 1234567812345678
    expect(type).to.not.exist

describe 'card.restrictNumeric', ->
  it 'should work', ->
    works = true
    e = {
      preventDefault: ()->
        works = false
    }

    e.keyCode = 49
    ret = restrictNumeric e
    works.should.eq true
    ret.should.eq true

  it 'should work with space', ->
    works = true
    e = {
      preventDefault: ()->
        works = false
    }

    e.keyCode = 32
    ret = restrictNumeric e
    works.should.eq false
    ret.should.eq false

  it 'should work with special character webkit', ->
    works = true
    e = {
      preventDefault: ()->
        works = false
    }

    e.keyCode = 0
    ret = restrictNumeric e
    works.should.eq true
    ret.should.eq true

  it 'should work with special character ff', ->
    works = true
    e = {
      preventDefault: ()->
        works = false
    }

    e.keyCode = 31
    ret = restrictNumeric e
    works.should.eq true
    ret.should.eq true

  it 'should fail', ->
    works = true
    e = {
      preventDefault: ()->
        works = false
    }

    e.keyCode = 65
    ret = restrictNumeric e
    works.should.eq false
    ret.should.eq false
