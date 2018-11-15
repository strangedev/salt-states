# dipf-devops-saltstack

Repository of salt states.

## How to use

### Setting up the state files

The state files located in the `states` directory are intended for use with a saltstack master.
Once the salt master is installed on the machine of your choice, the states provided should
be placed into one of the master's `file_roots` ([saltstack documentation](https://docs.saltstack.com/en/latest/ref/file_server/file_roots.html)).
 
### Setting up the pillars

The state files provided here rely on pillars to provide configuration values. Configuration should _not_
be done by modifying state files, but by updating pillars and data files. Example pillar files
are provided in the `pillar.example` directory. For information on a pillar's structure, please
consult the README file provided with the specific pillar.

Place your own pillar files into one of the master's `pillar_roots`.

### Setting up data

Some data, for example ssh keys and config files, are provided as files, not through pillars.
Example data is provided in the `data.example` directory. Using the same directory layout as
the `data.example` directory, place your own files into one of the master's `file_roots`. 
