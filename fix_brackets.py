import glob

files = [
    'lib/features/patients/presentation/pages/patients_page.dart',
    'lib/features/tasks/presentation/pages/tasks_page.dart',
    'lib/features/departments/presentation/pages/departments_page.dart',
    'lib/features/dashboard/presentation/pages/dashboard_page.dart',
    'lib/features/employees/presentation/pages/employees_page.dart'
]

for f in files:
    with open(f, 'r') as file:
        content = file.read()
    
    # We want to replace:
    #             ),
    #           ],
    #         ),
    #       ),
    
    #     ),
    #     );
    # 
    #   }
    # }
    
    # The actual string currently at the end of patients_page is:
    #             ),
    #           ],
    #         ),
    #       ),
    #     ),
    #     );
    #
    #   }
    # }

    # Let's just find the last occurence of "          ]," and replace everything after it.
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
}
"""
        content = prefix + new_suffix
        with open(f, 'w') as file:
            file.write(content)
            print("Fixed", f)
