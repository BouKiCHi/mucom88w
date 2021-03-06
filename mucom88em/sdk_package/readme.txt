//----------------------------------------------------------------------------------//
//																					//
//		████╗  ████╗██╗   ██╗ ██████╗ ██████╗ ████╗  ████╗ ███████╗  ███████╗ 		//
//		█████╗█████║██║   ██║██╔════╝██╔═══██╗█████╗█████║███╔══███╗███╔══███╗		//
//		██╔█████╔██║██║   ██║██║     ██║   ██║██╔█████╔██║╚███████╔╝╚███████╔╝		//
//		██║╚███╔╝██║██║   ██║██║     ██║   ██║██║╚███╔╝██║███╔══███╗███╔══███╗		//
//		██║ ╚══╝ ██║╚██████╔╝╚██████╗╚██████╔╝██║ ╚══╝ ██║╚███████╔╝╚███████╔╝		//
//		╚═╝      ╚═╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝      ╚═╝ ╚══════╝  ╚══════╝ 		//
//													Extended Memory Edition			//
//																					//
//										    Program modified by MUCOM™ 2019-2020	//
//						OpenMucom88 Ver.1.7 Copyright 1987-2019(C) Yuzo Koshiro		//
//																					//
//----------------------------------------------------------------------------------//

● はじめに

このたびは、MUCOM88 Extended Memory Edition SDK(以下、MUCOM88emSDK)をダウンロード
頂き、誠にありがとうございます。
このアーカイブには以下のファイルを収録しています。

・readme.txt (このファイル)
・MUCOM88em.txt (MUCOM88emの特徴と従来との相違点の説明)
・MUCOM88_REF.txt (リファレンスマニュアル)
・mucom88em_sdk.d88 (拡張RAM対応MUCOM88)
・mucom88em_sdk_vedit.d88 (VOICEエディタツール)


● 目次

はじめに
目次
MUCOM88とMUCOM88emについて
動作環境
MUCOM88emSDKについて
サンプル曲の演奏方法
MUCOM88emのMML文の基本
音色設定の基本
楽曲の演奏と停止
演奏中のモニタリング
MMLまたはコンパイルデータの読み込みと保存
その他運用によく使用するコマンド
MUCOM88 ライセンス
サンプル ライセンス
謝辞
履歴


● MUCOM88とMUCOM88emついて

　MUCOM88は、古代祐三氏が自ら開発した、NEC PC-8801mkⅡSR以降に搭載されたYM2203及
びYM2608(サウンドボードⅡ)を対象とする楽曲制作用ツールです。
　1987年頃から開発をスタートし自身が思い描く曲を作るために少しずつバージョンアッ
プを繰り返し、その間に培った音色ライブラリーもプリセットで使用することができます。
　MUCOM88は2018年12月にフリーソフトとして株式会社エインシャント様より公開されま
した。

　<MUCOM88公式ページ>
　OPEN MUCOM PROJECT (株式会社エインシャント様)
　https://www.ancient.co.jp/~mucom88/

　MUCOM88emは、MUCOM88の最終バージョン(Ver.1.7)をPC-8801シリーズ用の拡張RAMに対応
させる事により、従来よりも大きな楽曲の作成と演奏を可能にした改造バージョンになり
ます。
　MUCOM88emの特徴と従来との相違点については「MUCOM88em.txt」をご参照下さい。

　従来のMUCOM88と同様、MUCOM88emはPC-8801実機で使用して頂くかエミュレータで使用す
ることができますので、ご使用頂ける環境が揃っている方は是非音楽制作ツールの一つと
して役立ててください。


● 動作環境

・NEC PC-8801mkⅡSR以降(サウンドボードⅡ対応)+64KB以上の拡張RAM
  (PC-8801mkⅡMR/MA/MA2/MC/PC-88VA/VA2/VA3/PC-98DO/DO+は標準で上記要件を満たす
拡張RAMを搭載しています。)
　(PC-8801MC/FE2の8MHzHモードでは、YM2608のリズム音源が正常に演奏されない場合が
ありますので、8MHzSモードでご使用ください。)
・PC-8801mkⅡSR以降対応の各種エミュレータ


● MUCOM88emSDKについて

MUCOM88emSDKは、ライセンスを明確にするために、ALPHA-DOS部分を切り離した
バージョンとなっています。ご使用の際には、別途ALPHA-DOSをご用意ください。

尚、動作確認済のALPHA-DOSの対応バージョンはVer.2.99になります。
Ver.2.98以前の物は使用できませんのでご注意下さい。

MUCOM88emSDKに含まれるファイルは、CC BY-NC-SA 4.0ライセンスに基づき、
非営利の利用に限定し、改変、加工、もしくはそのままの形で、
複製、転載が可能です。
その際には、下記の権利表記してください。

Yuzo Koshiro 2018

ALPHA-DOS部分のライセンスは、再配布を禁止するCC BY-NC-ND 4.0となっています。
自身で作成したデータを公開する際には、MUCOM88emSDKに含まれるファイルのみで
構成されたディスクイメージを配布するようにしてください。

営利目的での利用をご希望の場合は
株式会社エインシャント様へお問い合わせください。

著作権に関する問い合わせ先:
info@ancient.co.jp


● サンプル曲の演奏方法

ディスクイメージ内には、サンプル曲が3曲収録されています。
これらは、以下の手順で演奏できます。
なお、コマンド自体は大文字・小文字を問いません。

files              (ディスク内のファイル一覧を表示)
load "sampl1"      (sampl1 (サウンドボードⅡ用)をロードする)
poll p (またはF.5) (コンパイル実行後、演奏を開始します)

演奏を停止する場合は、ESCキーを押すか、POLL CLSコマンドを実行します。


● MUCOM88emのMML文の基本

　※MUCOM88emのMML文はMUCOM88 Ver.1.7と完全互換です。
　　詳細はリファレンスマニュアル「MUCOM88_REF.txt」をご参照下さい。

　MUCOM88emは、MMLをPC-8801のN88BASICのREM文として記述します。
最初に行番号、スペースに続いてREM文を意味する「'」とチャンネル(A～K)、
スペースを記述し、MMLを入力していきます。

例)
10 'A t210 @70o3v15l16 [a8>aa<]4


・PC-8801mkⅡSR以降(YM2203)のチャンネル
　ABCチャンネルはFM音源
　DEFチャンネルはSSG音源

・PC-8801mkⅡSR以降サウンドボードⅡ(YM2608)搭載時のチャンネル
　ABCチャンネルはFM音源
　DEFチャンネルはSSG音源
　Gチャンネルはリズム音源
　HIJチャンネルはFM音源
　KチャンネルはADPCM音源


● 音色設定の基本

　音色設定は2通りの設定の仕方があります。

・コマンド

　poll k コマンドを入力すると音色エディタツールが起動します。
プリセット音色を元に修正したり新しい音色を追加できます。

・MML内に記載

行 '  @(音色番号)
行 '  FB, AL
行 '  AR, DR, SR, RR, SL, TL, KS, ML, DT
行 '  AR, DR, SR, RR, SL, TL, KS, ML, DT
行 '  AR, DR, SR, RR, SL, TL, KS, ML, DT
行 '  AR, DR, SR, RR, SL, TL, KS, ML, DT

という形で入力することができます。
' の後は必ずスペースを2つ以上入れてください。

例)
10 '  @1
20 '   5,  1
30 '  31,  0,  0,  6,  0, 30,  0,  2,  1
40 '  31,  0,  0,  6,  0, 33,  0,  2,  1
50 '  31,  0,  0,  6,  0, 13,  0,  8,  5
60 '  31,  0,  0,  6,  0,  0,  0,  2,  5


● 楽曲の演奏と停止

poll p コマンドまたは「F.5」で、MMLをコンパイル後、自動的に演奏します。
演奏の一時停止と再開は「ESC」キーで可能です。
poll s コマンドで、既にコンパイルされているデータを再演奏します。
poll cls コマンドで、フェードアウト後に演奏を停止します。


● 演奏中のモニタリング

poll mon コマンドで演奏中のモニタリング画面になります。
BASICに戻るにはSTOPキーを押してください。


● MMLまたはコンパイルデータの読み込みと保存

　MMLはBASICと同じようにload/saveコマンド、コンパイルしたデータは
bload/bsaveコマンドで、読み込みと保存を行います。

load "anc01"

save "anc01"

bload "anc01.bin",0,1

bsave "anc01.bin",0,&hXXXX,1

※ XXXXは画面最上部のAddressの()内の数値


● その他、運用によく使用するコマンド

　ALPHA-DOSは基本的にN88BASICに準じますが、一部拡張されているコマンドもあります。
　主なものを以下に示します。

files (ドライブ番号)
　ディスク内のファイルの一覧を表示します。
　　例) files             (ドライブ1側の一覧を表示する場合)
　　　  files 2           (ドライブ2側の一覧を表示する場合)
　　ファイル名は 6文字 + 拡張子3文字で、大文字と小文字を区別します。
　　ファイル名と拡張子の間が
        . の場合は BASICファイル
        * の場合は バイナリファイル
       (スペース) の場合は アスキー形式のファイル
　　を示します。

load (ファイル名)
　BASICファイルをメモリに読み込みます。
　　例) load "anc01"
　　　  load "2:anc01"    (ドライブ2側からロードする場合)

save (ファイル名)
　メモリ上のBASICファイルをディスクに保存します。
　　例) save "anc01"
　　　  save "2:anc01"    (ドライブ2側へセーブする場合)

list (行番号)
　入力されているリストを表示します。ハイフンによる範囲指定が可能です。
    例) list 100        100行を表示
        list -400       先頭から400行までを表示
        list 200-       200行から最後までを表示
        list 100-200    100行から200行までを表示
        list .          最後に編集を行なった行を表示

edit (行番号)
　スクリーンエディットを行います。
　ROLL UPキーとROLL DOWNキーで編集行をスクロールさせることができます。
　スクリーンエディットを中断するには HOME/CLRキーを押します。

delete (行番号)
　複数行をまとめて削除します。
　listコマンド同様に、ハイフンによる範囲指定が可能です。
　1行だけを削除する場合は、deleteコマンドを使用しなくとも、行番号だけを
　入力することで削除できます。
    例) delete -400     先頭から200行までを削除
        delete 100-200  100行から200行までを削除

renum (新規開始行番号,旧開始行番号,増分)
　行番号を付け直します。増分は省略した場合 10 ずつ増加になります。
    例) renum 100       新たに100行からつけ直します。
        renum 1000,200  現在の200行以降を1000行からとしてつけ直します。

auto (開始行番号,増分)
　行番号を自動的に発行します。停止したいときは STOP キーを押します。

new
　入力されているリストを全て消去します。


・ALPHA-DOSで拡張されたコマンド

bload (ファイル名) [,ロードアドレス][,バンク]
　コンパイル済み曲データ等のバイナリデータをメモリに読み込みます。
　ロードアドレスを省略した場合は、保存したときのアドレスに読み込みます。
　バンクを省略した場合は、前回操作したバンクに読み込みます。
　　例) bload "anc01.bin",0,1

bsave (ファイル名),セーブアドレス,長さ[,バンク]
　メモリ上のコンパイル済み曲データ等のバイナリデータを保存します。
　セーブアドレスは画面の1行目の Address: の後の数値(通常は0)、
　長さはその後に続く( )内の数値を記述します。
　バンクを省略した場合は、前回操作したバンクに書き込みます。
　　例) bsave "anc01.bin",0,&he1e,1

iset (ドライブ番号)
　省略時のドライブを指定したドライブに設定します。

iset erase (ドライブ番号)
　指定したドライブのディスクをフォーマットします。(実行時に確認がありませんのでご注意ください)

iset option ドライブ番号1,ドライブ番号2,スタートトラック,エンドトラック
　ドライブ番号1→ドライブ番号2へ、トラック単位でコピーします。

name "ファイル名" to ドライブ番号
　指定のファイルを指定したドライブ番号へコピーします。

files list (ドライブ番号)
　詳細なファイルの一覧を表示します。(bsaveされたアドレス情報など)


● MUCOM88 ライセンス

MUCOM88emはオリジナルのMUCOM88のライセンスに準じます。

Name        : MUCOM88
Version     : v1.5/v1.7
Platform    : The Nippon Electric Company (NEC) PC-8801 Series. v1/v2 mode,
Copyright   : (C) Yuzo Koshiro 2018
License     : CC BY-NC-SA 4.0

This software is provided 'as-is', without any express or implied warranty.
In no event will the authors be held liable for any damages arising from 
the use of this software.

Attribution-NonCommercial-ShareAlike 4.0 International.
https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en

1. Share:
	copy and redistribute the material in any medium or format
    copy and redistribute the material in any medium or format
    The licensor cannot revoke these freedoms as long as you follow the license terms.

2. NonCommercial:
   You must give appropriate credit, provide a link to the license, and indicate if
   changes were made. You may do so in any reasonable manner, but not in any way that
   suggests the licensor endorses you or your use. 

3. ShareAlike — If you remix, transform, or build upon the material,
   you must distribute your contributions under the same license as the original.


● サンプル ライセンス

本イメージファイルに添付されております
sample1.muc、sample2.muc、sample3.mucの３つについては、
CC BY-NC-SA 4.0に基づき、
非営利の利用に限定し、改変、加工、もしくはそのままの形で、
複製、転載が可能です。
その際には、下記の権利表記してください。

Yuzo Koshiro 2018


これらの楽曲を、営利目的での利用をご希望の場合は
株式会社エインシャントへお問い合わせください。


著作権に関する問い合わせ先:
info@ancient.co.jp


● 謝辞

作成にあたり、ご協力頂いたおにたま(onionsoftware)様、
神たま(good-software)様、UME-3様、CAT-2様、ぼうきち様、kumatan様、
そしてオリジナルのPC-8801版を作成、並びにフリー公開して下さった古代祐三様、
誠にありがとうございました。


● 関連サイト

OPEN MUCOM PROJECT (株式会社エインシャント様)
https://www.ancient.co.jp/~mucom88/

Open MUCOM88 Wiki (onionsoftware/おにたま様)
https://github.com/onitama/mucom88/wiki

MUCOM88em Wiki
https://github.com/mucom88/mucom88/wiki


● 履歴

2020年01月24日 v1.00
               ・ALPHA-DOSをVer.2.98からVer.2.99に更新し、
                 拡張RAM上のバイナリデータのセーブ・ロードに対応。
               ・エラーメッセージファイルが読み込まれないバグの修正。
2019月11月17日 v0.30
               ・FM音色エディタの領域をメインRAMから拡張RAMに変更し、
                 メインメモリのフリーエリアを拡大。
               ・起動時の拡張RAM搭載チェック機構を改良。
               ・Jコマンドが正常に動作しないバグの修正。
2019年10月25日 v0.20
               ・FMプリセット音色データの領域をメインRAMから拡張RAMに変更し、
                 MMLソース領域とFMプリセット音色データの領域競合を改善。
               ・起動時の拡張RAM搭載チェック機構を追加。
               ・FMプリセット音色(@0、@1)が壊れる仕様バグの修正。
2019年10月22日 v0.10 初公開
               ・曲バイナリデータ領域をメインRAMから拡張RAMに変更し、
                 曲バイナリデータ領域のサイズを約8.5KBから32KBに拡大、及び
                 曲バイナリデータ領域と演奏モニタ及びPCMデータアドレス情報の領域競合を改善。
               ・MMLソース領域とFM音色エディタ及びSSGプリセット音色データの領域競合を改善。
