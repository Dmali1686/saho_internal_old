import sys
f = 'lib/features/diet/presentation/pages/diet_kitchen_page.dart'
with open(f, 'r') as file:
    content = file.read()

idx = content.rfind("          ],")
if idx != -1:
    prefix = content[:idx]
    new_suffix = """          ],
        ),
      ),
      ],
      ),
    ),
    );
  }
"""
    # Wait, the rest of the file has other methods like _buildSubHeader, _buildSummaryRow etc!
    # I CANNOT just replace everything after the `],`! I must only replace the specific closing brackets of the build method.
    pass
