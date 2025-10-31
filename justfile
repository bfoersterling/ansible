default:
	@just -l

start_docker:
	sudo systemctl start docker

test_unit: start_docker
	source hacking/env-setup && \
		ansible-test units --docker -v test/units/cli/test_doc.py

[working-directory("test/integration/targets/ansible-doc")]
test_int: start_docker
	source ../../../../hacking/env-setup && \
		ansible-test integration --docker -v -- ansible-doc

[working-directory("test/integration/targets/ansible-doc")]
test_int_alpine322: start_docker
	source ../../../../hacking/env-setup && \
		ansible-test integration --docker alpine322 -v -- ansible-doc

[working-directory("test/integration/targets/ansible-doc")]
test_int_fedora42: start_docker
	source ../../../../hacking/env-setup && \
		ansible-test integration --docker fedora42 -v -- ansible-doc

[working-directory("test/integration/targets/ansible-doc")]
test_int_ubuntu2204: start_docker
	source ../../../../hacking/env-setup && \
		ansible-test integration --docker ubuntu2204 -v -- ansible-doc

[working-directory("test/integration/targets/ansible-doc")]
test_int_ubuntu2404: start_docker
	source ../../../../hacking/env-setup && \
		ansible-test integration --docker ubuntu2404 -v -- ansible-doc

[working-directory("test/integration/targets/ansible-doc")]
test_int_local:
	source ../../../../hacking/env-setup && \
		ansible-test integration -v -- ansible-doc
