@echo off
:input
if exist %cd%\in.mp4 (ren %cd%\in.mp4 in.mp4) else (goto conversion)
:start
if exist C:\ffmpeg\bin\ffmpeg.exe (goto conversion) else (goto install)
:conversion
C:\ffmpeg\bin\ffmpeg.exe -i "in.mp4" -vf scale=3840:2160:flags=neighbor -r 60 -vcodec h264_amf -profile:v high -preset fast -qmin 13 -qmax 13 -c:a copy "out.mp4" 
C:\ffmpeg\bin\ffmpeg.exe -i "in.mp4" -vf scale=3840:2160:flags=neighbor -r 60 -vcodec h264_nvenc -profile:v high -preset fast -rc constqp -qp 14 -c:a copy "out.mp4" -y
goto success
:installFFmpeg
title Installing FFmpeg...
powershell Invoke-WebRequest "https://cdn.discordapp.com/attachments/985667930962403360/990277354590969926/ffmpeg-4.2-setup.exe" -OutFile "%temp%\ffmpeg-4.2-setup.exe"
%temp%\ffmpeg-4.2-setup.exe
goto start
:completed


 
