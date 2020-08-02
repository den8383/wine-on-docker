wine-launch-line:
	docker-compose up -d
	docker exec -it line wine ./.wine/drive_c/users/wineuser/Local\ Settings/Application\ Data/LINE/bin/LineLauncher.exe
wine-stop-line:
	docker-compose stop
