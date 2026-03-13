const assert = require('assert');
const add = require('../math'); 

describe('Math App Unit Tests', function() {
  
  it('should return 5 when adding 2 and 3', function() {
    assert.strictEqual(add(2, 3), 5);
  });

  it('should return -10 when adding -5 and -5', function() {
    assert.strictEqual(add(-5, -5), -10);
  });

});