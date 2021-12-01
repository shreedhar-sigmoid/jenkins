import http.server
import time
import psutil
from prometheus_client import start_http_server, Counter , Gauge

REQUEST_COUNT = Counter('app_requests_count', 'total app http request count',['app_name', 'endpoint'])
RANDOM_COUNT = Counter('app_random_count','increment counter by random value')
ram_metric = Gauge("memory_usage_bytes", "Memory usage in bytes.",{'host'})
cpu_metric = Gauge("cpu_usage_percent", "CPU usage percent.",{'host'})
APP_PORT = 9000
METRICS_PORT = 8002

class HandleRequests(http.server.BaseHTTPRequestHandler):

    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(bytes("<html><head><title>First Application</title></head><body style='color: #333; margin-top: 30px;'><center><h2>Welcome to our first Prometheus-Python application.</center></h2></body></html>", "utf-8"))
        self.wfile.close()
        REQUEST_COUNT.labels('prom_python_app', self.path).inc()
        RANDOM_COUNT.inc()
        while True:
            time.sleep(1)
             # Add ram metrics
            ram = psutil.virtual_memory()
            swap = psutil.swap_memory()

            ram_metric.set({'type': "virtual", }, ram.used)
            ram_metric.set({'type': "virtual", 'status': "cached"}, ram.cached)
            ram_metric.set({'type': "swap"}, swap.used)

            # Add cpu metrics
            for c, p in enumerate(psutil.cpu_percent(interval=1, percpu=True)):
                cpu_metric.set({'core': c}, p)
        


if __name__ == "__main__":
    start_http_server(METRICS_PORT)
    server = http.server.HTTPServer(('', APP_PORT), HandleRequests)
    server.serve_forever()


