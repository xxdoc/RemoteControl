VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "trayCls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Download by http://www.codefans.net
Option Explicit
'���ʶ��TrayForm��FROM����MDIFORM???
'ʶ����ֻ����OBJECT.��
'��Public TrayForm As form ֻ������FROM
'��Public TrayForm As mdiform ֻ������mdifrom
'��Public TrayForm As Object ��from mdifromͨ��
'����TrayForm_Unload,��TrayForm_Resize�ò���,վ���ɷ���һ��
Private WithEvents TrayForm As Form
Attribute TrayForm.VB_VarHelpID = -1
Private WithEvents TrayMdiForm As MDIForm
Attribute TrayMdiForm.VB_VarHelpID = -1

Public Sub setForm(Frm As Object)
Dim i As String
  On Error GoTo err
  i = Frm.AutoShowChildren
  Set TrayMdiForm = Frm
Exit Sub
err:
  If err.Number = 438 Then
  Set TrayForm = Frm
End If
End Sub
' �����¼������Ŵ�Ҷ����ö�������������뵽www.play78.com����
Public Sub TrayForm_Resize()
If laststate = 1 Then laststate = 0
    If TrayForm.WindowState <> vbMinimized Then _
        laststate = TrayForm.WindowState
End Sub

' �������˳�ʱ��ɾ��ϵͳ����
Private Sub TrayForm_Unload(Cancel As Integer)
    RemoveFromTray_cls
End Sub

Public Sub TrayMdiForm_Resize()
If laststate = 1 Then laststate = 0
    If TrayMdiForm.WindowState <> vbMinimized Then _
        laststate = TrayMdiForm.WindowState
End Sub

' �������˳�ʱ��ɾ��ϵͳ����
Private Sub TrayMdiForm_Unload(Cancel As Integer)
    TrayForm_Unload Cancel
End Sub
