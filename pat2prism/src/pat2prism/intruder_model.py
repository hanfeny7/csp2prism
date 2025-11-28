"""
Helpers to generate intruder specifications or parameters.
Currently the generator uses a template-based intruder; this module
is the place to put programmatic intruder generation in future.
"""

def intruder_options_default():
    return {
        'can_drop': True,
        'can_modify': True,
        'can_replay': True,
        'buffer_size': 1,
    }
