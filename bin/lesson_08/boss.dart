import 'game_character.dart';
import 'super_ability.dart';
import 'hero.dart';
import 'rpg_game.dart';

class Boss extends GameCharacter {
  SuperAbility? defence;
  bool isStunned = false;

  Boss(super.name, super.health, super.damage);

  void attack(List<Hero> heroes) {
    for (var hero in heroes) {
      if (hero.isAlive()) {
        int incomingDamage = damage;

        if (hero is Avrora) {
          hero.receiveDamage(incomingDamage);
        } else if (hero is TrickyBastard) {
          hero.receiveDamage(incomingDamage);
        } else if (hero is Berserk && defence != hero.ability) {
          int blocked = (RpgGame.random.nextInt(2) + 1) * 5;
          hero.blockedDamage = blocked;
          hero.health -= (damage - blocked);
        } else {
          hero.health -= incomingDamage;
        }

        if (hero is Bomber && hero.health <= 0) {
          hero.die(this);
        }
      }
    }
  }

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    int randomIndex = RpgGame.random.nextInt(variants.length);
    defence = variants[randomIndex];
  }

  @override
  String toString() {
    return 'Boss $name Health: $health Damage: $damage Defence: ${defence?.name ?? "No Defence"}';
  }
}
