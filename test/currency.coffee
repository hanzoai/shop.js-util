global.window = {
  location: {
    host: ''
  }
}

{ expect } = require 'chai'

{
  isZeroDecimal
  isCrypto
  renderUpdatedUICurrency
  renderUICurrencyFromJSON
  renderJSONCurrencyFromUI
} = require '../'

describe 'currency.isZeroDecimal', ->
  it 'should work', ->
    ret = isZeroDecimal 'usd'
    ret.should.eq false

    ret = isZeroDecimal 'jpy'
    ret.should.eq true

describe 'currency.isCrypto', ->
  it 'should work', ->
    ret = isCrypto 'usd'
    ret.should.eq false

    ret = isCrypto 'eth'
    ret.should.eq true

describe 'currency.renderUICurrencyFromJSON', ->
  it 'should work for standard currency', ->
    ret = renderUICurrencyFromJSON 'usd', 123456
    ret.should.eq '$1234.56'

  it 'should work for zero decimal', ->
    ret = renderUICurrencyFromJSON 'jpy', 123456
    ret.should.eq '¥123456'

  it 'should work for ethereum', ->
    ret = renderUICurrencyFromJSON 'eth', 123456
    ret.should.eq '0.000123456'

  it 'should work for bitcoin', ->
    ret = renderUICurrencyFromJSON 'btc', 1234567890
    ret.should.eq '1.23456789'

describe 'currency.renderJSONCurrencyFromUI', ->
  it 'should work for standard currency', ->
    ret = renderJSONCurrencyFromUI 'usd', '$1234.56'
    ret.should.eq 123456

  it 'should work for zero decimal', ->
    ret = renderJSONCurrencyFromUI 'jpy', '¥123456'
    ret.should.eq 123456

  it 'should work for ethereum', ->
    ret = renderJSONCurrencyFromUI 'eth', '0.000123456'
    ret.should.eq 123456

  it 'should work for bitcoin', ->
    ret = renderJSONCurrencyFromUI 'btc', '1.23456789'
    ret.should.eq 1234567890
