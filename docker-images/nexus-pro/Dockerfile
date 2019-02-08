FROM        sonatype/nexus3:3.14.0
HEALTHCHECK --interval=10s --timeout=10s --start-period=30s --retries=3 CMD sh -c "curl -s -I http://127.0.0.1:8081/${nexus_prefix} || exit 1"
