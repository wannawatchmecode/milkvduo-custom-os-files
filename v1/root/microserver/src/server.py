from http.server import HTTPServer, BaseHTTPRequestHandler
#from requests_toolbelt.multipart import decoder

def run(server_class=HTTPServer, handler_class=BaseHTTPRequestHandler):
    server_address = ('', 8000)
    httpd = server_class(server_address, handler_class)
    httpd.serve_forever()

print("Starting server on 192.168.0.1:8000")

#run()

# Now let's run it on the duo!

class MicroServer(BaseHTTPRequestHandler):
    def do_GET(self):
        #self.wfile.write("POST to /upload for uploading")
        self.send_response(200, message="POST to /upload for uploading")

    def do_OPTIONS(self):
        self.send_response(200, "ok")
        self.end_headers()

    def do_POST(self):
        print("Received post request")
        if self.path == '/upload':
            self.upload()

    def upload(self):
        print("Received upload request")
        contentlength = int(self.headers.get('content-length', 0));
        filename = self.headers.get('x-file-name'); #This is the filename to write to
        try:
            filename
        except:
            print("filename must be defined")
            self.send_response(400, "x-file-name header not set")
            return
        if filename is None or filename == "undefined":
            print("filename must be defined")
            self.send_response(400)
            return
        print("File name is " + filename + " with content length" + str(contentlength))
        line = self.rfile.read(contentlength);
        #parts = decoder.MultipartDecoder(body.encode(), headers['content-type'])
        #data = parts.content
#        while line != None:
        print(str(line))
        f = open(filename, "wb");
        f.write(line);
        f.close()
        print("Wrote file successfully: " + filename)
                                                                                #            line = self.rfile.read()
        self.send_response(200, "File uploaded")

    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, OPTIONS')
        self.send_header("Access-Control-Allow-Headers", "X-Requested-With")
        self.send_header("Access-Control-Allow-Headers", "*")
        super().end_headers()
        #self.send_header('Access-Control-Allow-Origin', '*')
        #self.end_headers()


print("Starting server on port 8000")
run(HTTPServer, MicroServer)
print("Server shutdown")
