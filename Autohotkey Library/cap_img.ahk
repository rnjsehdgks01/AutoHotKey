Gdip_CropImage(pBitmap, x, y, w, h)
{
pBitmap2 := Gdip_CreateBitmap(w, h), G2 := Gdip_GraphicsFromImage(pBitmap2)
Gdip_DrawImage(G2, pBitmap, 0, 0, w, h, x, y, w, h)
Gdip_DeleteGraphics(G2)
Gdip_DisposeImage(G2)
return pBitmap2
}

cap_img(image,hwnd, vx, vy,vvx,vvy,vw,vh) {
pToken:=Gdip_Startup()
pBitmapHayStack1:=Gdip_BitmapFromhwnd(hwnd)
pBitmapNeedle:=Gdip_CreateBitmapFromFile(image)

pBitmapHayStack:=Gdip_CropImage(pBitmapHayStack1, vvx, vvy, vw, vh)

IfExist, %image%.bmp
{
	MsgBox, 4, ���ϸ��ߺ�!!!!, ���ϸ��� �����մϴ�. `n���������� �����ϰ� �ٽýõ� �Ϸ���`n���� �����ּ���.
IFMsgBox, No
ExitApp 
else
{
Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
Gdip_Shutdown(pToken)

FileDelete, %image%.bmp
FileDelete, %image%_1.bmp
reload
}
}

Gdip_SaveBitmapToFile(pBitmapHayStack, image ".bmp")

Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
Gdip_Shutdown(pToken)

}