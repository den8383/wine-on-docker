#install LINE
```
docker exec -it line bash
(wineuser)$ wget https://desktop.line-scdn.net/win/new/LineInst.exe
(wineuser)$ winetricks vcrun2015
(wineuser)$ winetricks win7
(wineuser)$ wine LineInst.exe
```

#Launch 1
```
docker exec -it line bash
(wineuser)$ wine ~/.wine/drive_c/users/wineuser/Local\ Settings/Application\ Data/LINE/bin/LineLauncher.exe
```

#Launch 2
```
docker exec -it line wine ./.wine/drive_c/users/wineuser/Local\ Settings/Application\ Data/LINE/bin/LineLauncher.exe
```
#Launch 3
```
make wine-launch-line
```
