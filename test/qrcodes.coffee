global.window = {
  location: {
    host: ''
  }
}

{ expect } = require 'chai'

{
  renderCryptoQR
} = require '../'

describe 'renderCryptoQR', ->
  it 'should work', ->
    #Eth
    qr1 = renderCryptoQR('eth', 'addr', 1e9)
    qr1.should.eq 'ethereum:addr?value=1'

    #BTC
    qr2 = renderCryptoQR('btc', 'addr', 1e9)
    qr2.should.eq 'bitcoin:addr?amount=1'

    #Wut
    qr2 = renderCryptoQR('wut', 'addr', 1e9)
    qr2.should.eq 'unknown'

