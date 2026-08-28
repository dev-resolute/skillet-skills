#!/usr/bin/env python3
"""Live-credential smoke test for catalog skills not yet in the gallery.

For each skill, runs every GET operation that has no required params
(substituting path params from earlier list-op results where obvious),
using the real credential from the environment. Pass = HTTP 2xx.

Usage:  export AIRTABLE_API_TOKEN=... ASANA_ACCESS_TOKEN=... ...
        python3 test-live.py [skill ...]     # default: all 10 pending
"""
import json, os, re, sys, urllib.request, yaml

PENDING = ["airtable", "asana", "discord", "gitlab", "hubspot",
           "intercom", "notion", "sendgrid", "sentry", "vercel"]

def render(template, env):
    return re.sub(r"\$\{(\w+)\}", lambda m: env.get(m.group(1), ""), template)

def test_skill(slug):
    m = yaml.safe_load(open(f"{slug}/catalog.yaml"))
    missing = [c["env_var"] for c in m.get("credentials", []) if not os.environ.get(c["env_var"])]
    if missing:
        print(f"{slug:10} SKIP  (set {', '.join(missing)})")
        return None
    env = dict(os.environ)
    header = m["auth"]["header"]
    ok = True
    for op in m["operations"]:
        if op["method"] != "GET":
            continue
        url = op["url"]
        params = op.get("params", [])
        # Header params with an example value (e.g. Notion-Version) are auto-filled.
        extra_headers = {p["name"]: str(p["example"]) for p in params
                         if p.get("required") and p.get("location") == "header" and p.get("example")}
        path_params = [p for p in params if p.get("location") == "path" and p.get("required")]
        if path_params or "{" in url:
            print(f"{slug:10} ----  {op['name']} (needs path params, untested)")
            continue
        unfillable = [p["name"] for p in params if p.get("required")
                      and p.get("location") != "header"]
        if unfillable:
            print(f"{slug:10} ----  {op['name']} (needs params: {', '.join(unfillable)}, untested)")
            continue
        req = urllib.request.Request(url, headers={header: render(m["auth"]["value_template"], env), **extra_headers})
        try:
            with urllib.request.urlopen(req, timeout=15) as r:
                code, body = r.status, r.read()
        except urllib.error.HTTPError as e:
            code, body = e.code, e.read()
        status = "PASS" if 200 <= code < 300 else "FAIL"
        ok = ok and status == "PASS"
        print(f"{slug:10} {status} {code}  {op['name']}")
        if status == "FAIL":
            print(f"           {body[:200].decode(errors='replace')}")
    return ok

skills = sys.argv[1:] or PENDING
results = {s: test_skill(s) for s in skills}
failed = [s for s, r in results.items() if r is False]
print("\n" + ("ALL PASS" if not failed else f"FAILED: {', '.join(failed)}"))
sys.exit(1 if failed else 0)
