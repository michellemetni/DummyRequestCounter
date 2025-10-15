# tests/test_app.py
from fastapi.testclient import TestClient
from unittest.mock import MagicMock
from app.app import app, redis  # note the extra ".app"

def test_hello_endpoint(monkeypatch):
    # Create a fake Redis instance
    mock_redis = MagicMock()
    mock_redis.get.return_value = b"5"  # Pretend 5 visits already

    # Patch the Redis object inside app
    monkeypatch.setattr("app.app.redis", mock_redis)

    client = TestClient(app)
    response = client.get("/")

    # Assertions
    assert response.status_code == 200
    assert "Hello! This page has been visited" in response.text

    # Check that incr() was called (page counter increment)
    mock_redis.incr.assert_called_with("hits")
