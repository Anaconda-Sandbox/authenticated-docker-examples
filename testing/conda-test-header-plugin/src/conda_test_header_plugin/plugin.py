from conda import plugins


@plugins.hookimpl
def conda_session_headers(host: str):
    """Add a special header to mock an unregistered user."""
    yield plugins.CondaRequestHeader(
        name="X-Anaconda-Testing",
        value="user:unregistered",
    )
