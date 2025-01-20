///test_CastDamageSpell();

// setup
var testPassed          = true;
var mock_player         = instance_create(0, 0, Test_Player);
var mock_opponent       = instance_create(0, 0, Test_Opponent);
var mock_playerGrave    = instance_create(0, 0, GRAVE);
mock_player.graveyard   = mock_playerGrave;
var mock_creature       = instance_create(0, 0, Test_Creature);
var mock_spell          = instance_create(0, 0, Test_DamageSpell);

mock_creature.owner     = mock_opponent;
mock_creature.hp        = 4;
mock_spell.owner        = mock_player;
mock_spell.target       = mock_creature;
mock_spell.attack       = 2;


// run test
with(mock_spell) {
    event_user(0); // cast the mock spell
    var expected = 2;
    var actual   = mock_creature.hp;
    var caller   = "test_CastDamageSpell";
    testPassed = assertEquals(expected, actual, caller);
}


// tear down
instance_destroy(mock_player, true);
instance_destroy(mock_playerGrave, true);
instance_destroy(mock_opponent, true);
instance_destroy(mock_creature, true);
instance_destroy(mock_spell, true);


// return result
return testPassed;
