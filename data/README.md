# Console RPG

A console-based RPG built using Ruby as a learning project, focused on applying design patterns

## Architecture

### State pattern
All game screens (main menu, dungeons menu, locations, fight) are implemented as `State` objects.
[Link](https://refactoring.guru/design-patterns/state/ruby/example)
- `MenuContext` - holds the current `@state`, delegates `render`/`handle_input` to it, exposes `transition_to` for state switching and `player` as shared game state.
- `MenuState` - abstract base class, defines the `render` / `handle_input` contract (`NotImplementedError` if not overridden).
- Concrete states: `MainMenuState`, `DungeonsMenuState`, `LocationState`, `FightState` and etc..

Each state decides its own transitions (`context.transition_to(...)`) - the context itself has no knowledge of the state graph. This keeps adding new screens (e.g. inventory, shop) isolated from existing code.

`LocationState` is data-driven: one class serves every location (forest, cave, etc.), fed by JSON data instead of a subclass per location.

### Command pattern
Combat actions are objects, not inline logic.
[Link](https://refactoring.guru/design-patterns/command/ruby/example)
- `Command` - abstract base, defines `execute`.
- `AttackCommand` - current concrete implementation. Computes damage, applies it to the target.

Actions are decoupled from who performs them and from what decides them.

## Planned
- Additional `Strategy` implementations for different enemy behavior (defensive, flee at low hp, random action)
- Additional `Command` types: heal, flee, defend (temporary defense buff)
- `EnemyFactory` if enemy construction logic grows beyond simple `Models::Enemy.new(**monster_data)`
- RSpec coverage: contracts-equivalent tests for `Command`/`Strategy` objects in isolation (mocked actor/target), state transition tests (mocked `context`), `BattleProcess` tests with `sleep` stubbed out
- Possible Zeitwerk-based autoloading to replace manual `require_relative` chains as file count grows