import 'game_character.dart';
import 'super_ability.dart';
import 'boss.dart';
import 'rpg_game.dart';

abstract class Hero extends GameCharacter {
  SuperAbility ability;

  Hero(super.name, super.health, super.damage, this.ability);

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

class Warrior extends Hero {
  Warrior(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.criticalDamage);

  void applySuperPower(Boss boss, List<Hero> heroes) {
    int crit = (RpgGame.random.nextInt(5) + 2) * damage; // 2..6
    boss.health -= crit;
    print('Warrior $name hits critically $crit');
  }
}

class Magic extends Hero {
  bool hasBoostedThisRound = false;

  Magic(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.boost);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (!isAlive()) return;

    if (!hasBoostedThisRound && RpgGame.roundNumber <= 4) {
      int totalBoost = 0;
      for (var hero in heroes) {
        if (hero.isAlive() && hero != this) {
          int boost = RpgGame.random.nextInt(10) + 5;
          hero.damage += boost;
          totalBoost += boost;
        }
      }
      print('Magic ${name} boosted all heroes by total $totalBoost damage');
      hasBoostedThisRound = true;
    }
  }

  void resetBoostFlag() {
    hasBoostedThisRound = false;
  }
}

class Medic extends Hero {
  int healPonts;
  Medic(String name, int health, int damage, this.healPonts)
    : super(name, health, damage, SuperAbility.heal);

  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (var hero in heroes) {
      if (hero.isAlive() && this != hero) {
        hero.health += healPonts;
      }
    }
  }
}

class Berserk extends Hero {
  int blockedDamage = 0;
  Berserk(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.blockRevert);

  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= blockedDamage;
    print('Berserk $name is reverted $blockedDamage');
  }
}

//Новые герои

class Golem extends Hero {
  Golem(String name) : super(name, 500, 10, SuperAbility.shield);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Lucky extends Hero {
  Lucky(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.dodge);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Witcher extends Hero {
  bool hasResurrected = false;

  Witcher(String name, int health)
    : super(name, health, 0, SuperAbility.resurrect);

  @override
  void attack(Boss boss) {}

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (!isAlive() || hasResurrected) return;

    for (var hero in heroes) {
      if (!hero.isAlive()) {
        hero.health = this.health;
        this.health = 0;
        hasResurrected = true;
        print('Witcher $name sacrificed himself to resurrect ${hero.name}');
        break;
      }
    }
  }
}

class Thor extends Hero {
  Thor(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.stun);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (!isAlive()) return;

    if (RpgGame.random.nextBool()) {
      boss.isStunned = true;
      print('Thor $name stunned the boss!');
    }
  }
}

//доп герои
class Avrora extends Hero {
  int hiddenTurns = 0;
  int accumulatedDamage = 0;

  Avrora(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.avrora);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (!isAlive()) return;

    if (hiddenTurns == 0 && RpgGame.random.nextInt(100) < 30) {
      hiddenTurns = 2;
      print('Avrora $name went invisible for 2 turns!');
    }

    if (hiddenTurns > 0) {
      hiddenTurns--;
      print('Avrora $name is invisible this turn, avoids damage');
    } else if (accumulatedDamage > 0) {
      boss.health -= accumulatedDamage;
      print(
        'Avrora $name returns accumulated $accumulatedDamage damage to boss',
      );
      accumulatedDamage = 0;
    }
  }

  void receiveDamage(int dmg) {
    if (hiddenTurns > 0) {
      accumulatedDamage += dmg;
    } else {
      health -= dmg;
    }
  }
}

class TrickyBastard extends Hero {
  bool pretendingDead = false;

  TrickyBastard(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.tricky);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (!isAlive()) return;

    pretendingDead = RpgGame.random.nextBool();
    if (pretendingDead) {
      print('TrickyBastard $name pretends to be dead this round!');
    }
  }

  @override
  void attack(Boss boss) {
    if (!pretendingDead) super.attack(boss);
  }

  void receiveDamage(int dmg) {
    if (!pretendingDead) health -= dmg;
  }
}

class Bomber extends Hero {
  Bomber(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.bomber);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}

  void die(Boss boss) {
    boss.health -= 100;
    print('Bomber $name exploded and dealt 100 damage to boss!');
  }
}
