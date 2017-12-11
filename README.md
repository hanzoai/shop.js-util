# akasha [![NPM version][npm-img]][npm-url] [![Build Status][travis-img]][travis-url] [![Coverage Status][coveralls-img]][coveralls-url] [![Dependency Status][dependency-img]][dependency-url]

[![Greenkeeper badge](https://badges.greenkeeper.io/hanzoai/shop.js-util.svg?token=b29efc39e11191b7eeca81698d2766e9591979a001e88a7086964c78b725a181&ts=1513017972234)](https://greenkeeper.io/)
Cross-browser storage with cookie-based fallback. Inspired by
[store.js](https://github.com/marcuswestin/store.js/).

## Install
```bash
$ npm install akasha
```

## Usage
```javascript
import store from 'akasha';

// Store current user
store.set('user', {name: 'David'})

// Get current user
store.get('user')

// Remove current user
store.remove('user')

// Clear all keys
store.clear()
```

[travis-img]:     https://img.shields.io/travis/davidtai/akasha.svg
[travis-url]:     https://travis-ci.org/davidtai/akasha
[coveralls-img]:  https://coveralls.io/repos/davidtai/akasha/badge.svg?branch=master&service=github
[coveralls-url]:  https://coveralls.io/github/davidtai/akasha?branch=master
[dependency-url]: https://david-dm.org/davidtai/akasha
[dependency-img]: https://david-dm.org/davidtai/akasha.svg
[npm-img]:        https://img.shields.io/npm/v/akasha.svg
[npm-url]:        https://www.npmjs.com/package/akasha
[gitter-img]:     https://badges.gitter.im/join-chat.svg
[gitter-url]:     https://gitter.im/davidtai/hi

<!-- not used -->
[downloads-img]:     https://img.shields.io/npm/dm/akasha.svg
[downloads-url]:     http://badge.fury.io/js/akasha
[devdependency-img]: https://david-dm.org/davidtai/akasha/dev-status.svg
[devdependency-url]: https://david-dm.org/davidtai/akasha#info=devDependencies
