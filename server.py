import socket

SERVER_ADDRESS = ("", 65432)

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(SERVER_ADDRESS)
server_socket.listen(10)

while True:
    connection, address = server_socket.accept()
    while True:
        data = connection.recv(1024)
        try:
            data = data.decode("utf-8")
        except:
            pass
        if isinstance(data, str):  # if input is correct do work with data
            with open("/var/log/server.log", "a") as file:
                file.write(data)
            connection.send(bytes(f"OK:{data}", encoding="UTF-8"))
        else:
            connection.close()
