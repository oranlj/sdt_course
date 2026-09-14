import sys

import pytest

from greetlab.cli import main


def test_normal_name(monkeypatch, capsys):
    monkeypatch.setattr(
        sys, "argv", ["sdt-greet", "--name", "25060021025"]
    )
    main()
    assert capsys.readouterr().out == "Hello, 25060021025!\n"


def test_blank_name(monkeypatch):
    monkeypatch.setattr(sys, "argv", ["sdt-greet", "--name", "   "])
    with pytest.raises(SystemExit) as exc:
        main()
    assert exc.value.code == 2
