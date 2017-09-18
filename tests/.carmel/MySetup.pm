# DO NOT EDIT! Auto-generated via carmel install.
package Carmel::MySetup;

our %environment = (
  'inc' => [
    '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/Capture-Tiny-0.46/blib/lib',
    '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/Cpanel-JSON-XS-3.0239/blib/arch',
    '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/Cpanel-JSON-XS-3.0239/blib/lib',
    '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/Path-Tiny-0.104/blib/lib',
    '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/YAML-LibYAML-0.66/blib/arch',
    '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/YAML-LibYAML-0.66/blib/lib'
  ],
  'path' => [
    '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/Cpanel-JSON-XS-3.0239/blib/script'
  ],
  'execs' => {
    'Cpanel::JSON::XS' => {
      'cpanel_json_xs' => '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/Cpanel-JSON-XS-3.0239/blib/script/cpanel_json_xs'
    }
  },
  'base' => '/home/seidl/workspace/luftsonnet-lib',
  'modules' => {
    'Capture/Tiny.pm' => '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/Capture-Tiny-0.46/blib/lib/Capture/Tiny.pm',
    'Cpanel/JSON/XS.pm' => '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/Cpanel-JSON-XS-3.0239/blib/lib/Cpanel/JSON/XS.pm',
    'Cpanel/JSON/XS/Boolean.pm' => '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/Cpanel-JSON-XS-3.0239/blib/lib/Cpanel/JSON/XS/Boolean.pm',
    'Path/Tiny.pm' => '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/Path-Tiny-0.104/blib/lib/Path/Tiny.pm',
    'YAML/LibYAML.pm' => '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/YAML-LibYAML-0.66/blib/lib/YAML/LibYAML.pm',
    'YAML/XS.pm' => '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/YAML-LibYAML-0.66/blib/lib/YAML/XS.pm',
    'YAML/XS/LibYAML.pm' => '/home/seidl/.carmel/5.24.2-x86_64-linux-thread-multi/builds/YAML-LibYAML-0.66/blib/lib/YAML/XS/LibYAML.pm'
  },
  'prereqs' => {
    'runtime' => {
      'requires' => {
        'Capture::Tiny' => '0',
        'Cpanel::JSON::XS' => '0',
        'Path::Tiny' => '0',
        'YAML::XS' => '0'
      }
    }
  },
);

1;
