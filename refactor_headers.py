import os
import glob
import re

files = glob.glob('lib/features/*/presentation/pages/*.dart')

for f in files:
    with open(f, 'r') as file:
        content = file.read()
    
    # CASE 1: CustomScrollView with SliverToBoxAdapter child: DashboardHeader()
    if 'CustomScrollView(' in content and 'SliverToBoxAdapter(' in content and 'child: DashboardHeader()' in content and 'Column(' not in content[:content.find('CustomScrollView(')]:
        # Need to wrap CustomScrollView in Expanded, inside a Column, and move DashboardHeader outside
        # Find body: SafeArea(child: CustomScrollView(
        
        # Regex to match the CustomScrollView setup
        pattern = re.compile(r'(body:\s*SafeArea\(\s*child:\s*)CustomScrollView\(\s*physics:\s*const\s*BouncingScrollPhysics\(\),\s*slivers:\s*\[\s*const\s*SliverToBoxAdapter\(\s*child:\s*DashboardHeader\(\),\s*\),\s*SliverPadding\(\s*padding:\s*const\s*EdgeInsets\.symmetric\(horizontal:\s*20\.0,\s*vertical:\s*12\.0\),\s*sliver:\s*SliverList\(\s*delegate:\s*SliverChildListDelegate\(\[', re.DOTALL)
        
        match = pattern.search(content)
        if match:
            new_code = r'''\1Column(
          children: [
            const DashboardHeader(),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(['''
            content = content[:match.start()] + re.sub(pattern, new_code, match.group(0)) + content[match.end():]
            
            # Now we must add an extra closing parenthesis for the Expanded widget
            # Search for the end of CustomScrollView, which ends right before body ends.
            # Usually: 
            #           ],
            #         ),
            #       ),
            #     );
            #   }
            # }
            # Wait, the closing of CustomScrollView is ], ), ), ] for CustomScrollView, SafeArea.
            # Let's replace:
            #             ),
            #           ],
            #         ),
            #       ),
            #     );
            # with an extra parenthesis for Expanded
            end_pattern = re.compile(r'(\s*\]\s*,\s*\)\s*,\s*\)\s*,\s*\)\s*,\s*\]\s*,\s*\)\s*,\s*\)\s*,\s*\)\s*;)', re.DOTALL)
            # Actually, this is very brittle. It's better to just do string matching from bottom.
            # A safer way to add `)` is finding `);` at the end and manually tracing brackets. Or since we know how these files end:
            #                   ...
            #                 ]),
            #               ),
            #             ),
            #           ],
            #         ),
            #       ),
            #     );
            
            # We can just replace:
            #           ],
            #         ),
            #       ),
            #     );
            # with
            #           ],
            #         ),
            #       ),
            #     ),
            #   ),
            # );
            
            content = content.replace(
                "            ),\n          ],\n        ),\n      ),\n    );",
                "            ),\n          ],\n        ),\n      ),\n    ),\n    );\n"
            ) # This is a bit dirty, let's fix it manually.
            
            print(f"Refactored (Case 1) {f}")
            with open(f, 'w') as file:
                file.write(content)

    # CASE 2: SingleChildScrollView directly under SafeArea
    if 'SingleChildScrollView(' in content and 'body: SafeArea(' in content and 'Column(' not in content[:content.find('SingleChildScrollView(')]:
        # Let's check if there's DashboardHeader inside
        if 'DashboardHeader()' in content:
            print(f"Needs manual refactor (Case 2): {f}")
            
    # CASE 3: Already has Column, but DashboardHeader is inside Expanded -> SingleChildScrollView -> Column
    if 'Expanded(' in content and 'DashboardHeader()' in content:
        # Check if DashboardHeader is inside the Expanded
        pass

