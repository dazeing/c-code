   M S B A M L   `   `   `  ����A  =PTLNew, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:PTLNewPTLNew  5   	       PTLNew.ManageUsers   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   &localclr-namespace:PTLNew     5   	     � Title$  ManageUsers��5   	   $	��500��6   $	��800��6*    � 	Resources 5	       �� 
TargetType �� Property �� Value&   System.Windows.Controls.DataGrid��%G  '��       '�� �     '� 5    '  �    �� 5
   
   " ��6   .�5      ��  � ��
 �����68   �� 5       � ��$
 35,5q�65   �� 5       � ��$ 
1, 1, 1, 1q�6=   �� 5       � ��
 �   �69   5      �� 5   
   " ��6   .�5      ��  � ��
 �   �69   �� 5       � ��$ 2,2,2,2q�6=   5      �� 5   
   " �6   .�5      ��  � ��$ Verdana)�68   �� 5       � ��$
 14px(�66   5      �� 5   
   "  6   .�5      ��  �@ 
IsReadOnly . 6+   �� 5       � ��
 �����6+   5      5      .��5      �  � ShowGridLines .   � RowDefinitions 5   
   �� 5      $	��100 �6   �� 5       $��* �6   �� 5!      $	��100 �6   .+�5#   
   �� $$��Resources/Images/logo_main.png��6   $
��Left=�68   $
��0 10q�6S   �� 5$   
   $��Center=�6   $��Center=�5%      $7��1Управление пользователями��5&      $
��Bold"�5'      $��16(�6&   $��0q�64   6A     5(   
   -   5          Name$ DataGrid��5(         ClipboardCopyMode$ IncludeHeader=�5)      $��1��66   	   AutoGenerateColumns	 .  
   
IsReadOnly
 . $   HorizontalScrollBarVisibility$ Disabled=�6q      Columns 5*      0  *System.Windows.Controls.DataGridTextColumn  5+      ,  &System.Windows.Controls.DataGridColumn   Header$	 №��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ 50 60   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6;   �� *userid+  5,      $	 195 6%   $ 
Логин��61    6@   �� *login+  5-      $	 180 6%   $ Фамилия��61    6B   �� *	surname+  5.      $	 180 6%   $ Имя��61    6>   �� *name+  5/      $	 195 6%   $ Гражданство��61    6F   �� *	country+51      �� 52   
    �� Orientation$ 
Horizontal=�6   $��2��6/   $
��50,0q�6<   $��Right=�6J   $��Center=�6f   .+�53      �� -   5         ��Name$
 Edit��53      $	��Top=�6#   $ ��Редактировать��6;   6S   54      56      57      