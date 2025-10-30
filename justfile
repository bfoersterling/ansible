default:
	@just -l

test_unit:
	sudo systemctl start docker
	source hacking/env-setup && \
		ansible-test units --docker -v test/units/cli/test_doc.py

[working-directory("test/integration/targets/ansible-doc")]
test_int:
	source ../../../../hacking/env-setup && \
		ansible-test integration --docker -v -- ansible-doc
