import os

from conda import plugins


@plugins.hookimpl
def conda_session_headers(host: str):
    """Add a special header to mock an unregistered user."""
    if header_value := os.getenv("ANACONDA_TEST_HEADER"):
        yield plugins.CondaRequestHeader(
            name="X-Anaconda-Testing",
            value=header_value,
        )
