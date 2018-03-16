  export renderCryptoQR = (currency, address, amount)->
    switch currency
      when 'eth'
        return 'ethereum:' + address + '?value=' + amount / 1e9
      when 'btc'
        return 'bitcoin:' + address + '?amount=' + amount / 1e9
    return 'unknown'

